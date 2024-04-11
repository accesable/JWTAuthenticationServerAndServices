using MenuItemService.Models;
using Microsoft.EntityFrameworkCore;

namespace MenuItemService.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Item>().HasMany(i => i.Images).WithOne(i => i.Item).HasForeignKey(i => i.ItemId);
        }
        public DbSet<Item> Items { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Image> Images { get; set; }
    }
}
