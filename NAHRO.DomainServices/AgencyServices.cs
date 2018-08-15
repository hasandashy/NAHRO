using NAHRO.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NAHRO.DomainServices
{
    interface IAgencyService
    {
        Agency GetAgencyById(int id);

    }
    public class AgencyServices : IAgencyService
    {
        public Agency GetAgencyById(int id)
        {
            DataTable table = new DataTable("Table");
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spGetAgencyDetailsById";
                command.Parameters.AddWithValue("@Id", id);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(table);
            }

            List<Agency> agencies = new List<Agency>();
            agencies = Utills.ConvertDataTable<Agency>(table);

            return agencies.FirstOrDefault();
        }
    }
}
