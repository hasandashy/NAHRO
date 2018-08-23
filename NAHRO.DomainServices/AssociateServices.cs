using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NAHRO.Domain;

namespace NAHRO.DomainServices
{
    interface IAssociateService
    {
        List<Associates> GetAllAssociates();
        void DeleteAssociate(int id);
        List<Associates> GetNewAssociates();
        void AddAssociate(int id);
        int GetAssociatesCount();
    }
    public class AssociateServices : IAssociateService
    {
        public void AddAssociate(int id)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                command.CommandText = "spAddAssociate";


                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public void DeleteAssociate(int id)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                command.CommandText = "spDeleteAssociate";


                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }

        public List<Associates> GetAllAssociates()
        {
            DataTable table = new DataTable("Table");
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spGetAllAssociates";

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(table);
            }

            List<Associates> employees = new List<Associates>();
            employees = Utills.ConvertDataTable<Associates>(table);

            return employees;

        }

        public int GetAssociatesCount()
        {
            int count = 0;
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select count(1) from Associates where isDeleted = 0 and isMember = 1"; 


                connection.Open();
                count = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();
            }

            return count;
        }

        public List<Associates> GetNewAssociates()
        {
            DataTable table = new DataTable("Table");
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spGetNewAssociates";

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(table);
            }

            List<Associates> employees = new List<Associates>();
            employees = Utills.ConvertDataTable<Associates>(table);

            return employees;

        }
    }
}
