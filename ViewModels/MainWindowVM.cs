using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using UP01.ViewModels;

namespace UP01.ViewModels
{
    internal class MainWindowVM : BaseViewModel
    {
        private ICommand _commandExit;
        private ICommand _commandAddProduct;
        private ICommand _commandEditProduct;
        private ICommand _commandDeleteProduct;
        private string _userFullName;
        private IList<ProductDisplay> _products;

        public MainWindowVM(string userFullName)
        {
            if (userFullName == string.Empty)
            {
                UserFullName = "ГОСТЕВАЯ УЧЁТНАЯ ЗАПИСЬ";
            }
            else
            {
                UserFullName = userFullName;
            }
        }

        public MainWindowVM()
        {

        }

        public string UserFullName
        {
            get => _userFullName;
            set
            {
                _userFullName = value;
                OnPropertyChanged();
            }
        }

        public IList<ProductDisplay> ProductsList
        {
            get
            {
                if (_products == null)
                {
                    _products = new ObservableCollection<ProductDisplay>();
                    LoadProducts();
                }
                return _products;
            }
            set
            {
                _products = value;
                OnPropertyChanged();
            }
        }

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

        void LoadProducts()
        {
            foreach (var item in db.Product.ToList())
            {
                ProductsList.Add(new ProductDisplay(item));
            }
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
            var main = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            AuthWindow auth = new AuthWindow();

            auth.Show();
            main.Close();
        }
    }
}
