using System.ComponentModel.DataAnnotations;

namespace AuthenticationServer.Dtos.User
{
    public class UpdateUserRolesDto
    {
        [Required]
        public string ? userId { get; set; }
        [Required]
        public string [] ? roleNames { get; set; }
    }
}
