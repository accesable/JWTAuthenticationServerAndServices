using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace AuthenticationServer.Migrations
{
    /// <inheritdoc />
    public partial class AddWorkShift : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.CreateTable(
                name: "WorkShifts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    ShiftName = table.Column<string>(type: "varchar(128)", maxLength: 128, nullable: true),
                    EmployeeId = table.Column<string>(type: "varchar(255)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WorkShifts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WorkShifts_Users_EmployeeId",
                        column: x => x.EmployeeId,
                        principalTable: "Users",
                        principalColumn: "Id");
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.InsertData(
                table: "Roles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "176de4e1-31d4-4bda-bcfe-eaae450b013b", null, "Manager", "MANAGER" },
                    { "2b55e142-ef0f-486d-9c06-146382e26fe8", null, "Waiter", "WAITER" },
                    { "72b748ff-30b9-4553-a974-6f5e890c37b9", null, "Chef", "CHEF" },
                    { "b011a5c0-939c-4f52-a173-c5d79935da29", null, "Customer", "CUSTOMER" },
                    { "b1c916c2-f188-41da-be7b-a9be89b5af70", null, "Administrator", "ADMINISTRATOR" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_WorkShifts_EmployeeId",
                table: "WorkShifts",
                column: "EmployeeId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "WorkShifts");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "176de4e1-31d4-4bda-bcfe-eaae450b013b");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "2b55e142-ef0f-486d-9c06-146382e26fe8");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "72b748ff-30b9-4553-a974-6f5e890c37b9");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "b011a5c0-939c-4f52-a173-c5d79935da29");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: "b1c916c2-f188-41da-be7b-a9be89b5af70");

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
    }
}
