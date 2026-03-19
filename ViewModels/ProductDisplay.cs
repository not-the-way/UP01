using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UP01.Models;

namespace UP01.ViewModels
{
    public class ProductDisplay : BaseViewModel
    {
        private Product _product;

        public ProductDisplay(Product product)
        {
            _product = product;
        }

        public string Article => _product.Article;
        public string ProductName => _product.ProductName;
        public string EdIzm => _product.EdIzm;
        public double Cost => _product.Cost;
        public string Deliverer => _product.Deliverer;
        public string Manufacturer => _product.Manufacturer;
        public string ProductCategory => _product.ProductCategory;
        public double? CurrentDiscount => _product.CurrentDiscount;
        public int AmountStored => _product.AmountStored;
        public string Description => _product.Description;
        public string Image => _product.Image;

        public decimal? DiscountPrice
        {
            get
            {
                if (CurrentDiscount > 0)
                {
                    double discount = CurrentDiscount.Value / 100.0;
                    double difference = Cost * discount;
                    return (decimal?)(Cost - difference);
                }
                else return null;
            }
        }

        public string BackColor
        {
            get
            {
                if (CurrentDiscount > 17)
                {
                    return "#FFDEAD";
                }
                else return "transparent";
            }
        }

        public TextDecorationCollection DiscountDecor
        {
            get
            {
                if (CurrentDiscount > 0)
                {
                    return TextDecorations.Strikethrough;
                }
                else return null;
            }
        }

        public string TextColor
        {
            get
            {
                if (CurrentDiscount > 0)
                {
                    return "Red";
                }
                return "Black";
            }
        }

        public string AmountColor
        {
            get
            {
                if (AmountStored == 0)
                {
                    return "SkyBlue";
                }
                else return "Black";
            }
        }
    }
}
