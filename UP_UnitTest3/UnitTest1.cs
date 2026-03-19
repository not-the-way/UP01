using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using UP01.Models;
using UP01.ViewModels;

namespace UP_UnitTest3
{
    [TestClass]
    public class UnitTest1
    {
        private Product _testProduct;
        private ProductDisplay _productDisplay;

        [TestInitialize]
        public void Setup()
        {
            _testProduct = new Product
            {
                Article = "001",
                ProductName = "Тестовый товар",
                EdIzm = "шт",
                Cost = 1000,
                Deliverer = "Поставщик",
                Manufacturer = "Производитель",
                ProductCategory = "Игрушки",
                CurrentDiscount = 10,
                AmountStored = 15,
                Description = "Описание",
                Image = "test.jpg"
            };

            _productDisplay = new ProductDisplay(_testProduct);
        }


        [TestMethod]
        public void Properties_ShouldMapCorrectly()
        {
            Assert.AreEqual(_testProduct.Article, _productDisplay.Article);
            Assert.AreEqual(_testProduct.ProductName, _productDisplay.ProductName);
            Assert.AreEqual(_testProduct.EdIzm, _productDisplay.EdIzm);
            Assert.AreEqual(_testProduct.Cost, _productDisplay.Cost);
            Assert.AreEqual(_testProduct.Deliverer, _productDisplay.Deliverer);
            Assert.AreEqual(_testProduct.Manufacturer, _productDisplay.Manufacturer);
            Assert.AreEqual(_testProduct.ProductCategory, _productDisplay.ProductCategory);
            Assert.AreEqual(_testProduct.CurrentDiscount, _productDisplay.CurrentDiscount);
            Assert.AreEqual(_testProduct.AmountStored, _productDisplay.AmountStored);
            Assert.AreEqual(_testProduct.Description, _productDisplay.Description);
        }

        [TestMethod]
        public void DiscountPrice_WithDiscount_ShouldCalculateCorrectly()
        {
            Assert.AreEqual(900m, _productDisplay.DiscountPrice);
        }

        [TestMethod]
        public void DiscountPrice_WithoutDiscount_ShouldBeNull()
        {
            var product = new Product { Cost = 1000, CurrentDiscount = 0 };
            var display = new ProductDisplay(product);

            Assert.IsNull(display.DiscountPrice);
        }
    }
}
