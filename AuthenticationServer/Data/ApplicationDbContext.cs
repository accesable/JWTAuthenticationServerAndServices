using AuthenticationServer.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AuthenticationServer.Data
{
    public class ApplicationDbContext : IdentityDbContext<AppUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            foreach (var entityType in builder.Model.GetEntityTypes())
            {
                var  tableName = entityType.GetTableName() ?? throw new NullReferenceException();
                if (tableName.StartsWith("AspNet"))
                {
                    entityType.SetTableName(tableName.Substring(6));
                }
            }
            List<IdentityRole> roles = new List<IdentityRole>
            {
                new IdentityRole
                {
                    Name = "Administrator",
                    NormalizedName = "ADMINISTRATOR",
                },
                new IdentityRole
                {
                    Name = "Manager",
                    NormalizedName = "MANAGER"
                },
                new IdentityRole
                {
                    Name = "Waiter",
                    NormalizedName = "WAITER"
                },
                new IdentityRole
                {
                    Name = "Chef",
                    NormalizedName = "CHEF"
                },
                new IdentityRole
                {
                    Name = "Customer",
                    NormalizedName = "CUSTOMER"
                },
            };
            builder.Entity<IdentityRole>().HasData(roles);
        }
    }
}
