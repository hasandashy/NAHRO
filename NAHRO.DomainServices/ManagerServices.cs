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
    interface IManagerService
    {
        List<GroupManager> GetAllManagers();
        void DeleteManager(int id);
    }

    public class ManagerServices : IManagerService
    {
        public void DeleteManager(int id)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spDeleteManagers";
                command.Parameters.AddWithValue("@Id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public List<GroupManager> GetAllManagers()
        {
            DataTable table = new DataTable("Table");
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spGetAllManagers";

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(table);
            }

            List<GroupManager> employees = new List<GroupManager>();
            employees = Utills.ConvertDataTable<GroupManager>(table);

            return employees;

        }
    }
}
