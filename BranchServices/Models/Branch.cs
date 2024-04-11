using System.ComponentModel.DataAnnotations;

namespace BranchServices.Models
{
    public class Branch
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string ? BranchName { get; set; }
        [Required]
        public string? Address { get; set; }
        [Required]
        public string? ContactInformation { get; set; } = null;
        [Required]
        public int Capacity { get; set; }

    }
}
