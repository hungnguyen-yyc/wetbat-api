using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace wetbat_api.Repositories
{
    public class QuoteTableDataGateway : AbstratTableDataGateway
    {

        public DataTable GetQuotes() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllQuotesQuery(), connection))
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

        private String GetSelectAllQuotesQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, TripId, VehicleRateId, GroupId, Amount, Status ");
            sb.Append("FROM [dbo].[Quotes]");
            return sb.ToString();
        }
    }
}