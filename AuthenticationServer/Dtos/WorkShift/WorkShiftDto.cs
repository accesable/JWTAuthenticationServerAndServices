using System.ComponentModel.DataAnnotations;

namespace AuthenticationServer.Dtos.WorkShift
{
    public class WorkShiftDto
    {
        [Required]
        public string? userId { get; set; }
        [Required]
        public string[]? shiftNames { get; set; }
    }
}
