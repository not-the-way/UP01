using System.Windows;
using System.Windows.Controls;

namespace UP01.Helpers
{
    public static class PasswordBoxHelper
    {
        public static readonly DependencyProperty BoundPasswordProperty =
            DependencyProperty.RegisterAttached(
                "BoundPassword",
                typeof(string),
                typeof(PasswordBoxHelper),
                new PropertyMetadata(string.Empty, (d, e) =>
                {
                    if (d is PasswordBox pb && pb.Password != (string)e.NewValue)
                    {
                        pb.PasswordChanged -= OnPasswordChanged;
                        pb.Password = (string)e.NewValue;
                        pb.PasswordChanged += OnPasswordChanged;
                    }
                }));

        public static void SetBoundPassword(PasswordBox element, string value) =>
            element.SetValue(BoundPasswordProperty, value);

        public static string GetBoundPassword(PasswordBox element) =>
            (string)element.GetValue(BoundPasswordProperty);

        private static void OnPasswordChanged(object sender, RoutedEventArgs e) =>
            SetBoundPassword((PasswordBox)sender, ((PasswordBox)sender).Password);
    }
}