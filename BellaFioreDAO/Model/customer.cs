using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BellaFioreDAO.Model
{
    public class Customer : BaseModel
    {
        public short id_customer { get; set; }
        public string ci { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string second_surname { get; set; }
        public string email { get; set; }
        public string phone { get; set; }

        public Customer(short Id, string Ci, string Name, string Surname, string Second_surname, string Email, string Phone)
        {
            id_customer = Id;
            ci = Ci;
            name = Name;
            surname = Surname;
            second_surname = Second_surname;
            email = Email;
            phone = Phone;
        }



    }
}
