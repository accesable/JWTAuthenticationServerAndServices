using System.ComponentModel.DataAnnotations;

namespace MenuItemService.Dtos
{
    public class ItemDto
    {
        public int ItemId { get; set; }
        public string? ItemName { get; set; }
    }
    public class ItemRequest
    {
        [Required]
        [StringLength(128)]
        public string? ItemName { get; set; }
        [Required]
        [StringLength(255)]
        public string? ItemDescription { get; set; }
        [Required]
        public decimal OriginalPrice { get; set; }
        /*        public ICollection<ImageRequest>? Images { get; set; }*/
        public int CategoryId { get; set; }

        [Required]
        public bool IsCharged { get; set; }
    }
}
