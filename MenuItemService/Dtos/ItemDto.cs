using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

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
        [DefaultValue(false)]
        [AllowNull]
        public bool ? IsCharged { get; set; } = false;
    }
}
