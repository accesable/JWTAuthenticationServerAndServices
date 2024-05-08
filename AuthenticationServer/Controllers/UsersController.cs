using AuthenticationServer.Data;
using AuthenticationServer.Dtos.User;
using AuthenticationServer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AuthenticationServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly ApplicationDbContext _context;
        public class UserWithRolesAndWorkShift : AppUser
        {
            public string? RoleNames { get; set; }
            public string? WorkShift { get; set; }
        }
        public UsersController(UserManager<AppUser> userManager,ApplicationDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            var qr = _userManager.Users.OrderBy(u => u.UserName).Select(u => new UserWithRolesAndWorkShift()
            {
                Id = u.Id,
                UserName = u.UserName,
                Address = u.Address,
                Contact = u.Contact,
                PhoneNumber = u.PhoneNumber,
                FullName=u.FullName,
            });

            var users = await qr.ToListAsync();
            foreach (var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                var workShift = await _context.WorkShifts.Where(ws => ws.EmployeeId == user.Id).Select(ws => ws.ShiftName).ToListAsync();
                user.RoleNames = string.Join(",", roles);
                user.WorkShift = string.Join (",", workShift);
            };
            var reVal = users.Select(u=> new {Id = u.Id,FullName=u.FullName,Username = u.UserName,Roles=u.RoleNames , Address=u.Address, Contact=u.Contact,PhoneNumber = u.PhoneNumber , WorkShift=u.WorkShift}).ToList();
            return Ok(reVal);
        }
        [HttpPost("update-user-role")]
        public async Task<IActionResult> UpdateUserRole(UpdateUserRolesDto updateUserRolesDto)
        {
            var user = await _userManager.FindByIdAsync(updateUserRolesDto.userId);
            if (user == null)
            {
                return NotFound("Cannot find user.");
            }

            var roles = await _userManager.GetRolesAsync(user);

            foreach (var roleName in updateUserRolesDto.roleNames)
            {
                if (roles.Contains(roleName))
                {
                    continue;
                }

                await _userManager.AddToRoleAsync(user, roleName);
            }

            foreach (var roleName in roles)
            {
                if (updateUserRolesDto.roleNames.Contains(roleName))
                {
                    continue;
                }

                await _userManager.RemoveFromRoleAsync(user, roleName);
            }

            return Ok("Roles updated successfully.");
        }
    }
}