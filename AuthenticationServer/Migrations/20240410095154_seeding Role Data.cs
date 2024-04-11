using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace AuthenticationServer.Migrations
{
    /// <inheritdoc />
    public partial class seedingRoleData : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Roles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "2e672d92-4c4c-4c65-b581-5205c5f10962", null, "Chef", "CHEF" },
                    { "66c3b8bf-29b9-4702-b2ac-144add1fa5d8", null, "Administrator", "ADMINISTRATOR" },
                    { "ae69518e-c505-4a13-bb98-cf7b561a75f2", null, "Customer", "CUSTOMER" },
                    { "e4042583-fa13-4c74-a8c9-882338b99a5a", null, "Waiter", "WAITER" },
                    { "f7cc071e-4d82-4502-81d2-d8f1dd7978e2", null, "Manager", "MANAGER" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "2e672d92-4c4c-4c65-b581-5205c5f10962");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "66c3b8bf-29b9-4702-b2ac-144add1fa5d8");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "ae69518e-c505-4a13-bb98-cf7b561a75f2");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "e4042583-fa13-4c74-a8c9-882338b99a5a");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "f7cc071e-4d82-4502-81d2-d8f1dd7978e2");
        }
    }
}
