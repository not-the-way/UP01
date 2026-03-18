using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using UP01.Models;

namespace UP01.ViewModels
{
    internal class MainWindowVM : BaseViewModel
    {
        private ICommand _commandExit;
        private ICommand _commandAddProduct;
        private ICommand _commandEditProduct;
        private ICommand _commandDeleteProduct;
        private string _userFullName;
        private IList<Product> _products;

        public string UserFullName
        {
            get => _userFullName;
            set
            {
                _userFullName = value;
                OnPropertyChanged();
            }
        }

        public IList<Product> ProductsList => _products ?? (_products = new ObservableCollection<Product>());

        public ICommand CommandExit
        {
            get { return _commandExit ??  (_commandExit = new RelayCommand(Exit)); }
        }

        public ICommand CommandAddProduct
        {
            get { return _commandAddProduct ?? (_commandAddProduct = new RelayCommand(AddProduct)); }
        }

        public ICommand CommandEditProduct
        {
            get { return _commandEditProduct ?? (_commandEditProduct = new RelayCommand(EditProduct)); }
        }

        public ICommand CommandDeleteProduct
        {
            get { return _commandDeleteProduct ?? (_commandDeleteProduct = new RelayCommand(DeleteProduct)); }
        }

        void AddProduct()
        {
            ProductAddEditWindow add = new ProductAddEditWindow();
            add.Show();
        }

        void EditProduct()
        {
            ProductAddEditWindow add = new ProductAddEditWindow();
            add.Show();
        }

        void DeleteProduct()
        {
            // Пусто...
        }

        void Exit()
        {
            MainWindow main = new MainWindow();
            AuthWindow auth = new AuthWindow();

            auth.Show();
            main.Close();
        }
    }
}
