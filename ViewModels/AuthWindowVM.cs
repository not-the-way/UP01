using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using UP01.Models;

namespace UP01.ViewModels
{
    public class AuthWindowVM : BaseViewModel
    {
        public Users currentUser;

        private string insertedLogin;
        private string insertedPassword;

        private ICommand _guestLoginCommand;
        private ICommand _loginCommand;
        private IList<Users> _users;

        public IList<Users> UsersList => _users ?? (_users = new ObservableCollection<Users>());

        public Users CurrentUser
        {
            get { return currentUser; }
            set
            {
                currentUser = value;
                OnPropertyChanged();
            }
        }

        public string InsertedLogin
        {
            get => insertedLogin;
            set
            {
                insertedLogin = value;
                OnPropertyChanged();
            }
        }

        public string InsertedPassword
        {
            get => insertedPassword;
            set
            {
                insertedPassword = value;
                OnPropertyChanged();
            }
        }

        public ICommand CommandLogin
        {
            get
            {
                return _loginCommand ?? (_loginCommand = new RelayCommand(Login));
            }
        }

        public ICommand CommandGuestLogin
        {
            get
            {
                return _guestLoginCommand ?? (_guestLoginCommand = new RelayCommand(GuestLogin));
            }
        }

        void Login()
        {
            if (currentUser == null)
            {
                MessageBox.Show("Введите данные для авторизации!");
            }
            else
            {
                if (currentUser.Login == insertedLogin && currentUser.Password == insertedPassword)
                {
                    MainWindow main = new MainWindow();
                    main.Show();

                    AuthWindow auth = new AuthWindow();
                    auth.Hide();
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль!");
                }
            }
        }

        void GuestLogin()
        {
            MainWindow main = new MainWindow();
            main.Show();

            AuthWindow auth = new AuthWindow();
            auth.Hide();
        }
    }
}
