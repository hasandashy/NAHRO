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
    interface IEmployeeService
    {
        List<Employee> GetAllEmplyees();
        void DeleteEmployee(int id);
        bool CheckEmail(string email);
        bool CheckEmployeeByName(string fName,string lName);
        void AddEmployee(Employee employee);
    }

    public class EmployeeServices : IEmployeeService
    {
        public void AddEmployee(Employee employee)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "AddEmployee";
                command.Parameters.AddWithValue("@prefix", employee.Prefix);
                command.Parameters.AddWithValue("@fname", employee.FirstName);
                command.Parameters.AddWithValue("@mname", employee.MiddleName);
                command.Parameters.AddWithValue("@lname", employee.LastName);
                command.Parameters.AddWithValue("@nickname", employee.NickName);
                command.Parameters.AddWithValue("@suffix", employee.Suffix);
                command.Parameters.AddWithValue("@email", employee.Email);
                command.Parameters.AddWithValue("@agencyId", employee.AgencyId);
                command.Parameters.AddWithValue("@phone", employee.Phone);
                command.Parameters.AddWithValue("@fax", employee.Fax);
                command.Parameters.AddWithValue("@jobTitle", employee.JobTitle);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public bool CheckEmail(string email)
        {
            string isEmail = string.Empty;
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spCheckEmail";
                command.Parameters.AddWithValue("@email", email);
                connection.Open();
                isEmail = command.ExecuteScalar().ToString();
                connection.Close();
            }
            return (isEmail == "exist" ? false : true);
        }

        public bool CheckEmployeeByName(string fName, string lName)
        {
            return true;
        }

        public void DeleteEmployee(int id)
        {
             using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spDeleteEmployee";
                command.Parameters.AddWithValue("@Id", id);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        public List<Employee> GetAllEmplyees()
        {
            DataTable table = new DataTable("Table");
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-V3VNLNG\\SQLEXPRESS;Database=NAHRO;Trusted_Connection=Yes;"))
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "spGetAllEmployees";

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(table);
            }

            List<Employee> employees = new List<Employee>();
            employees = Utills.ConvertDataTable<Employee>(table);

            return employees;
        }



    }
}
