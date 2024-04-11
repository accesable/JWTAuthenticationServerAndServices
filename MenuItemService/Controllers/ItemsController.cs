using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MenuItemService.Data;
using MenuItemService.Models;
using MenuItemService.Dtos;
using System.ComponentModel.DataAnnotations;

namespace MenuItemService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ItemsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Items
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Item>>> GetItems()
        {
            var items = await _context.Items
                .Include(i => i.Images)
                .Include(i => i.Category)
                .Select(item => new Item
                {
                    ItemId = item.ItemId,
                    ItemName = item.ItemName,
                    ItemDescription = item.ItemDescription,
                    OriginalPrice = item.OriginalPrice,
                    CategoryId = item.CategoryId,
                    Category = new Category
                    {
                        CategoryId = item.Category.CategoryId,
                        CategoryName = item.Category.CategoryName
                    },
                    Images = item.Images.Select(img => new Image
                    {
                        ImageId = img.ImageId,
                        ImageUrl = img.ImageUrl
                    }).ToList(),
                    IsCharged = item.IsCharged,
                    IsLocked = item.IsLocked,
                }).ToListAsync();
            return items;
        }

        // GET: api/Items/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Item>> GetItem(int id)
        {
            var item = await _context.Items.FindAsync(id);

            if (item == null)
            {
                return NotFound();
            }

            return item;
        }
        [HttpPut("status/{id}")]
        public async Task<ActionResult<Item>> GetItemStatus(int id, [Required] string status)
        {
            var item = await _context.Items.FindAsync(id);

            if (item == null)
            {
                return NotFound();
            }
            if (status == "lock")
            {
                item.IsLocked = true;
            }
            else if (status == "unlock")
            {
                item.IsLocked = false;
            }
            await _context.SaveChangesAsync();

            return Ok(new { item.IsLocked });
        }

        // PUT: api/Items/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutItem(int id, Item item)
        {
            if (id != item.ItemId)
            {
                return BadRequest();
            }

            _context.Entry(item).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Items
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost, DisableRequestSizeLimit]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<Item>> PostItem([FromForm] ItemRequest itemRequest, [FromForm] List<IFormFile> files)
        {
            Item insertedItem = new()
            {
                ItemName = itemRequest.ItemName,
                ItemDescription = itemRequest.ItemDescription,
                OriginalPrice = itemRequest.OriginalPrice,
                CategoryId = itemRequest.CategoryId,
                IsCharged = itemRequest.IsCharged,
                Images = new List<Image>()
            };
            _context.Items.Add(insertedItem);
            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    // Generate a unique file name to prevent file name conflicts
                    var fileName = Path.GetRandomFileName() + Path.GetExtension(file.FileName);

                    // Define the path to save the file; adjust the path as per your requirement
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "ImageStaticFiles/Items", fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }

                    // Assuming you save the file in wwwroot/images and want to access it via a relative URL
                    var imageUrl = $"/Items/{fileName}";

                    // Create a new Image object and add it to the Images collection of the insertedItem
                    insertedItem.Images.Add(new Image { ImageUrl = imageUrl });
                }
            }
            await _context.SaveChangesAsync();

            // Construct the response object
            var response = new
            {
                insertedItem.ItemId,
                insertedItem.ItemName,
                insertedItem.ItemDescription,
                insertedItem.OriginalPrice,
                insertedItem.CategoryId,
                Images = insertedItem.Images.Select(img => new { img.ImageId, img.ImageUrl }).ToList()
            };

            // Return a 200 OK response with the item and image information
            return Ok(response);
        }

        // DELETE: api/Items/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItem(int id)
        {
            var item = await _context.Items.FindAsync(id);
            if (item == null)
            {
                return NotFound();
            }

            _context.Items.Remove(item);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ItemExists(int id)
        {
            return _context.Items.Any(e => e.ItemId == id);
        }
    }
}
