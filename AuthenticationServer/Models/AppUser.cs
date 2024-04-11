using Microsoft.AspNetCore.Identity;

namespace AuthenticationServer.Models
{
    public class AppUser : IdentityUser
    {
        public string? FullName { get; set; }
        public string? Contact { get; set; }
        public string? Address { get; set; }
    }
}
