﻿namespace AuthenticationServer.Dtos.Account
{
    public class NewUserDto
    {
        public string ? Id { get; set; }
        public string? FullName { get; set; }
        public string? UserName { get; set; }
        public string? Email { get; set; }
        public string? AccessToken { get; set; }
        public IList<string> Roles { get; set; }
    }
}
