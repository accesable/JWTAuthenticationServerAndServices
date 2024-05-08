using AuthenticationServer.Data;
using AuthenticationServer.Dtos.Account;
using AuthenticationServer.Dtos.WorkShift;
using AuthenticationServer.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthenticationServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkShiftController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public WorkShiftController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        // GET: api/<WorkShiftController>
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            var workShifts = await _context.WorkShifts.ToListAsync();

            return Ok(workShifts);
        }

        // GET api/<WorkShiftController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<WorkShift>> Get(int id)
        {
            var workShift = await _context.WorkShifts.FindAsync(id);
            if(workShift == null)
            {
                return NotFound();
            }
            workShift.AppUser = await _userManager.FindByIdAsync(workShift.EmployeeId);

            return Ok(workShift);
        }

        // POST api/<WorkShiftController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] WorkShiftDto workShiftDto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                var user = await _userManager.FindByIdAsync(workShiftDto.userId);
                if (user == null)
                {
                    return BadRequest("User not found");
                }

                // Retrieve existing work shifts for the user
                var existingWorkShifts = await _context.WorkShifts
                    .Where(ws => ws.EmployeeId == workShiftDto.userId)
                    .ToListAsync();

                // If no existing work shifts, insert new ones
                if (existingWorkShifts.Count == 0)
                {
                    foreach (var shiftName in workShiftDto.shiftNames)
                    {
                        var newWorkShift = new WorkShift { EmployeeId = workShiftDto.userId, ShiftName = shiftName };
                        _context.WorkShifts.Add(newWorkShift);
                    }
                }
                else
                {
                    // Remove existing work shifts
                    _context.WorkShifts.RemoveRange(existingWorkShifts);

                    // Insert new work shifts
                    foreach (var shiftName in workShiftDto.shiftNames)
                    {
                        var newWorkShift = new WorkShift { EmployeeId = workShiftDto.userId, ShiftName = shiftName };
                        _context.WorkShifts.Add(newWorkShift);
                    }
                }

                // Save changes to the database
                await _context.SaveChangesAsync();

                return Ok("Work shifts updated successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        // PUT api/<WorkShiftController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<WorkShiftController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
