using BellaFioreDAO.Implementation;
using BellaFioreDAO.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BellaFioreWPF
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Console.WriteLine("Nombre: " + Tbname.Text);
            Console.WriteLine("Apellido: " + Tbsurname.Text);
            Console.WriteLine("Correo electrónico: " + Tbemail.Text);
            Console.WriteLine("Teléfono: " + Tbphone.Text);

            try
            {
                CustomerImpl customerImpl = new CustomerImpl();
                Customer customer = new Customer("", Tbname.Text, Tbsurname.Text, "", Tbemail.Text, Tbphone.Text);
                customerImpl.Insert(customer);
                
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }

        }
    }
}
