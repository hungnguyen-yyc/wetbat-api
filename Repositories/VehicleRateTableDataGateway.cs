using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace wetbat_api.Repositories
{
    public class VehicleRateTableDataGateway : AbstratTableDataGateway
    {
        public DataTable GetVehicleRates() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllVehicleRatesQuery(), connection))
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

        private String GetSelectAllVehicleRatesQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, Vehicle, Currency, Amount ");
            sb.Append("FROM [dbo].[VehicleRates]");
            return sb.ToString();
        }
    }
}