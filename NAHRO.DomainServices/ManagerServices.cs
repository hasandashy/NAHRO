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
        void AddManager(int id);
        List<GroupManager> GetAllManagers();
        void DeleteManager(int id);
        List<GroupManager> GetNewManagers();
        int GetManagerCount();
    }

    public class ManagerServices : IManagerService
    {
        public void AddManager(int id)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                command.CommandText = "spAddManager";


                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

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

      

        public int GetManagerCount()
        {
            int count = 0;
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select count(1) from GroupManagers WHERE isDeleted = 0 and isMember = 1";


                connection.Open();
                count = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();
            }

            return count;
        }

        public List<GroupManager> GetNewManagers()
        {
            DataTable table = new DataTable("Table");
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spGetNewManagers";

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
