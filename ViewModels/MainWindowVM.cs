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
    public class MainWindowVM : BaseViewModel
    {
        private ICommand _commandExit;
        private ICommand _commandAddProduct;
        private ICommand _commandEditProduct;
        private ICommand _commandDeleteProduct;
        private string _userFullName;
        private string _userRole;
        private bool _isAdmin;
        private IList<ProductDisplay> _products;
        private ProductDisplay _selectedProduct;

        public MainWindowVM(string userFullName, string userRole)
        {
            if (userFullName == string.Empty)
            {
                UserFullName = "ГОСТЕВАЯ УЧЁТНАЯ ЗАПИСЬ";
                UserRole = "Авторизованный клиент";
            }
            else
            {
                UserFullName = userFullName;
                UserRole = userRole;
                IsAdmin = AdminPanelVisibility(UserRole);
            }
        }

        public MainWindowVM()
        {

        }

        ProductDisplay SelectedProduct
        {
            get { return _selectedProduct; }
            set
            {
                _selectedProduct = value;
                OnPropertyChanged();
            }
        }

        public bool IsAdmin
        {
            get => _isAdmin;
            set
            {
                _isAdmin = value;
                OnPropertyChanged();
            }
        }

        public string UserRole
        {
            get => _userRole;
            set
            {
                _userRole = value;
                OnPropertyChanged();
            }
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

        IList<ProductDisplay> ProductsList
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
            ProductsList.Remove(SelectedProduct);
        }

        void Exit()
        {
            var main = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            AuthWindow auth = new AuthWindow();

            auth.Show();
            main.Close();
        }

        bool AdminPanelVisibility(string userRole)
        {
            switch (userRole)
            {
                case "Авторизованный клиент":
                    return false;
                case "Менеджер":
                    return false;
                case "Администратор":
                    return true;
                default:
                    return false;
            }
        }
    }
}
