namespace AuthenticationServer.Dtos.Account
{
    public class NewUserDto
    {
        public string? UserName { get; set; }
        public string? Email { get; set; }
        public string? AccessToken { get; set; }
    }
}
