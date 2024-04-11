namespace MenuItemService.Dtos
{
    public class CategoryDto
    {
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public ICollection<ItemDto>? Items { get; set; }
    }
    public class CategoryRequest
    {
        public string? CategoryName { get; set; }
    }
}
