using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace wetbat_api.Repositories
{
    public class TripTableDataGateway : AbstratTableDataGateway
    {
        public DataTable GetTrips() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllTripsQuery(), connection))
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

        private String GetSelectAllTripsQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, Departure, Destination, StartDate, ToDate ");
            sb.Append("FROM [dbo].[Trips]");
            return sb.ToString();
        }
    }
}