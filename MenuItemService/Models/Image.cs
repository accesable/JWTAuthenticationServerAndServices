using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MenuItemService.Models
{
    public class Image
    {
        [Key]
        public int ImageId { get; set; } // Primary key
        [Required]
        public required string ImageUrl { get; set; } // Property to store the URL of the image
        public int ItemId { get; set; } // Foreign key property to associate with the Item

        [ForeignKey("ItemId")] // Foreign key attribute to associate with the Item
        public Item? Item { get; set; } // Navigation property back to the Item
    }
}
