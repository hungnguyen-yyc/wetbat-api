using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Data.SqlClient;
using wetbat_api.Models;
using System.Data;

namespace wetbat_api.Repositories
{
    public class AirportTableDataGateway : AbstratTableDataGateway
    {

        public DataTable GetAirports() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllAirportsQuery(), connection))
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

        private String GetSelectAllAirportsQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, Name, Code, LocationId ");
            sb.Append("FROM [dbo].[PickupLocations]");
            return sb.ToString();
        }
    }
}