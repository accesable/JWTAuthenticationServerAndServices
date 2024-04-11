using System.ComponentModel.DataAnnotations;

namespace MenuItemService.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required]
        [StringLength(255)]
        public string? CategoryName { get; set; }
        public ICollection<Item> Items { get; set; } = new List<Item>();
    }
}
