using Microsoft.Data.SqlClient;

namespace wetbat_api.Repositories
{
    public abstract class AbstratTableDataGateway
    {
        protected SqlConnectionStringBuilder Builder;

        // TODO: hide the connection string
        public AbstratTableDataGateway()
        {
            this.Builder = new SqlConnectionStringBuilder();
            this.Builder.DataSource = "wetbat.database.windows.net";
            this.Builder.UserID = "hungnguyen";
            this.Builder.Password = "W3tb@t123";
            this.Builder.InitialCatalog = "wetbat";
        }
    }
}