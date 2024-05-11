using BellaFioreDAO.Implementation;
using BellaFioreDAO.Interfaces;
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
            try
            {
                CustomerImpl customerImpl = new CustomerImpl();
                Customer customer = new Customer("", Tbname.Text, Tbsurname.Text, "", Tbemail.Text, Tbphone.Text);
                customerImpl.Insert(customer);
                CleanForm();
                Select();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }

        }
        void CleanForm()
        {
            Tbname.Clear();
            Tbsurname.Clear();
            Tbemail.Clear();
            Tbphone.Clear();
        }
        void Select()
        {
            Dgcustomerdata.ItemsSource = null;
            CustomerImpl customerImpl = new CustomerImpl();
            DataTable result = customerImpl.Select();
            Dgcustomerdata.ItemsSource = result.DefaultView;
            Dgcustomerdata.Columns[0].Visibility = Visibility.Collapsed;
        }

        private void Btnload_Click(object sender, RoutedEventArgs e)
        {
            Select();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Select();
        }
    }
}
