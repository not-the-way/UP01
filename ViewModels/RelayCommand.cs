using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace UP01.ViewModels
{
    internal class RelayCommand : ICommand
    {
        private Action _action;
        private Action<object> _actionObj;

        public RelayCommand(Action action)
        {
            _action = action;
        }

        public RelayCommand(Action<object> actionObj)
        {
            _actionObj = actionObj;
        }

        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            if (_actionObj != null) return false;

            return true;
        }

        public void Execute(object parameter)
        {
            _action?.Invoke();
        }
    }
}
