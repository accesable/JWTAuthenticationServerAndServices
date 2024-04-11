using AuthenticationServer.Models;

namespace AuthenticationServer.Interfaces
{
    public interface ITokenService
    {
        string createToken(AppUser user,IList<string> ? roles);
    }
}
