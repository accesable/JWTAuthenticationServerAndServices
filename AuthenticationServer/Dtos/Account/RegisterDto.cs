using System.ComponentModel.DataAnnotations;

namespace AuthenticationServer.Dtos.Account
{
    public class RegisterDto
    {
        [Required]
        public string? FullName { get; set; }
        [Required]
        public string? Contact { get; set; }
        [Required]
        public string? Address { get; set; }
        [Required]
        [EmailAddress]
        public string? Email { get; set; }
        [Required]
        public string? Password { get; set; }
    }
}
