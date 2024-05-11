using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BellaFioreDAO.Implementation
{
    public class BaseImpl
    {
        string connectionString = "Server=LAPTOP-8DVHUM6G;Database=bd_bellafiore;Trusted_Connection=True;";
        public string query;
        public SqlCommand CreateBasicCommand()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            return command;
        }

        public SqlCommand CreateBasicCommand(string query)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(query, connection);
            command.Connection = connection;
            return command;
        }

        /// <summary>
        /// Insert, Update, Delete
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        public int ExecuteBasicCommand(SqlCommand command)
        {
            try
            {
                command.Connection.Open();
                return command.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                command.Connection.Close();
            }
        }

        public DataTable ExecuteDataTableCommand(SqlCommand command)
        {
            DataTable dt = new DataTable();
            try
            {
                command.Connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                command.Connection.Close();
            }
            return dt;
        }
    }
}
