using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace wetbat_api.Repositories
{
    public class LocationTableDataGateway : AbstratTableDataGateway
    {
        public DataTable GetLocations() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllLocationsQuery(), connection))
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

        private String GetSelectAllLocationsQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, CityName, Country, Currency ");
            sb.Append("FROM [dbo].[Locations]");
            return sb.ToString();
        }
    }
}