﻿using BellaFioreDAO.Interfaces;
using BellaFioreDAO.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BellaFioreDAO.Implementation
{
    public class CustomerImpl : BaseImpl, ICustomer
    {
        public int Delete(Customer t)
        {
            query = @"UPDATE customer SET is_active = 0, last_update= CURRENT_TIMESTAMP
                      WHERE id_customer=@id_customer";
            SqlCommand command = CreateBasicCommand(query);
            command.Parameters.AddWithValue("@id_customer", t.id_customer);

            try
            {
                return ExecuteBasicCommand(command);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int Insert(Customer t)
        {
            query = @"INSERT INTO customer (ci,name, surname, second_sur_name, email, phone, created_by)
                      VALUES(@ci,@name, @surname, @second_sur_name, @email, @phone,1)";
            SqlCommand command = CreateBasicCommand(query);
            command.Parameters.AddWithValue("@ci", t.ci);
            command.Parameters.AddWithValue("@name", t.name);
            command.Parameters.AddWithValue("@surname", t.surname);
            command.Parameters.AddWithValue("@second_sur_name", t.second_surname);
            command.Parameters.AddWithValue("@email", t.email);
            command.Parameters.AddWithValue("@phone", t.phone);

            try
            {
                return ExecuteBasicCommand(command);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable Select()
        {
            query = @"SELECT id_customer,ci AS 'CI' ,name AS 'Nombre', surname AS 'Apellido',  email AS 'Correo', phone AS 'Celular'
                      FROM customer
                      WHERE is_active=1
                      ORDER BY 3";
            SqlCommand command = CreateBasicCommand(query);

            try
            {
                return ExecuteDataTableCommand(command);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int Update(Customer t)
        {
            query = @"UPDATE customer SET ci = @ci, name = @name, surname = @surname, second_sur_name = @second_surname, email = @email, phone = @phone, last_update = CURRENT_TIMESTAMP
              WHERE id_customer = @id_customer";
            SqlCommand command = CreateBasicCommand(query);
            command.Parameters.AddWithValue("@ci", t.ci);
            command.Parameters.AddWithValue("@name", t.name);
            command.Parameters.AddWithValue("@surname", t.surname);
            command.Parameters.AddWithValue("@second_surname", t.second_surname);
            command.Parameters.AddWithValue("@email", t.email);
            command.Parameters.AddWithValue("@phone", t.phone);
            command.Parameters.AddWithValue("@id_customer", t.id_customer);
            Console.WriteLine(t.id_customer);

            try
            {
                return ExecuteBasicCommand(command);
                
            }
            catch (Exception ex)
            {   
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }
    }
}
