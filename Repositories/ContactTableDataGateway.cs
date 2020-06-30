using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace wetbat_api.Repositories
{
    public class ContactTableDataGateway : AbstratTableDataGateway
    {
        public DataTable GetContacts() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllContactsQuery(), connection))
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

        private String GetSelectAllContactsQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, Address, Phone ");
            sb.Append("FROM [dbo].[Contacts]");
            return sb.ToString();
        }
    }
}