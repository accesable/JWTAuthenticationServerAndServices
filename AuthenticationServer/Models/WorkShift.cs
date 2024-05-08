using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AuthenticationServer.Models
{
    public class WorkShift
    {
        [Key]
        public int Id { get; set; }
        [MinLength(3)]
        [StringLength(128)]
        public string? ShiftName { get; set; }
        [ForeignKey(nameof(EmployeeId))]
        public AppUser? AppUser { get; set; }
        public string? EmployeeId { get; set; }
    }
}
