using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace wetbat_api.Repositories
{
    public class UserTableDataGateway : AbstratTableDataGateway
    {
        public DataTable GetUsers() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllUsersQuery(), connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            data.Load(reader);
                        }
                    }                    
                }
                return data;
            }
            catch (SqlException e)
            {
                //TODO log it somewhere
                Console.WriteLine(e.ToString());
                return data;
            }
        }

        private String GetSelectAllUsersQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, FirstName, LastName, MiddleName, ContactId ");
            sb.Append("FROM [dbo].[Users]");
            return sb.ToString();
        }
    }
}