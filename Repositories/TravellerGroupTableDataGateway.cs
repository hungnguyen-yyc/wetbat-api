using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Data.SqlClient;
using wetbat_api.Models;
using System.Data;

namespace wetbat_api.Repositories
{
    public class TravellerGroupTableDataGateway : AbstratTableDataGateway
    {

        public DataTable GetTravellerGroups() {
            DataTable data = new DataTable();
            try 
            { 
                using (SqlConnection connection = new SqlConnection(Builder.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(this.GetSelectAllTravellerGroupsQuery(), connection))
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

        private String GetSelectAllTravellerGroupsQuery() {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT Id, GroupId, TravellerId ");
            sb.Append("FROM [dbo].[TravellerGroups]");
            return sb.ToString();
        }
    }
}