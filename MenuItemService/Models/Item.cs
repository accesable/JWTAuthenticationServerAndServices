using System.ComponentModel.DataAnnotations;

namespace MenuItemService.Models
{
    public class Item
    {
        [Key]
        public int ItemId { get; set; }
        [Required]
        [StringLength(128)]
        public string? ItemName { get; set; }
        [Required]
        [StringLength(255)]
        public string? ItemDescription { get; set; }
        [Required]
        public decimal OriginalPrice { get; set; }
        public ICollection<Image> Images { get; set; } = new List<Image>();
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        public bool IsLocked { get; set; } = false;
        public bool IsCharged { get; set; } = false;
    }
}