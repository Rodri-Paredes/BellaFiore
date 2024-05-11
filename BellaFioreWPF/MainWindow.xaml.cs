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
        private Customer selectedCustomer;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {   
            try
            {
                CustomerImpl customerImpl = new CustomerImpl();
                Customer customer = new Customer(0,"", Tbname.Text, Tbsurname.Text, "", Tbemail.Text, Tbphone.Text);
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
        private void FillForm()
        {
            Tbname.Text = this.selectedCustomer.name;
            Tbsurname.Text = this.selectedCustomer.surname;
            Tbemail.Text = this.selectedCustomer.email;
            Tbphone.Text = this.selectedCustomer.phone;
        }
        private void Dgcustomerdata_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataRowView dataRow = (DataRowView)Dgcustomerdata.SelectedItem;
            if(Dgcustomerdata.SelectedItem != null)
            {
                short id = short.Parse(dataRow.Row.ItemArray[0].ToString());
                string name = dataRow.Row.ItemArray[2].ToString();
                string surname = dataRow.Row.ItemArray[3].ToString();
                string email = dataRow.Row.ItemArray[4].ToString();
                string phone = dataRow.Row.ItemArray[5].ToString();
                Console.WriteLine(id);
                this.selectedCustomer = new Customer(id, "", name, surname, "", email, phone);
                FillForm();
            }
         
        }

        private void Btnupdate_Click(object sender, RoutedEventArgs e)
        {
            CustomerImpl customerImpl = new CustomerImpl();
            Customer customer = new Customer(this.selectedCustomer.id_customer, "", Tbname.Text, Tbsurname.Text, "", Tbemail.Text, Tbphone.Text);
            customerImpl.Update(customer);
            Select();
            CleanForm();
        }

        private void Btndelete_Click(object sender, RoutedEventArgs e)
        {
            CustomerImpl customerImpl = new CustomerImpl();
            customerImpl.Delete(this.selectedCustomer);
            Select();
        }
    }
}
