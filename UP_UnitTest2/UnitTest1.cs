using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using UP01;
using UP01.ViewModels;

namespace UP_UnitTest2
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Commands_ShouldNotBeNull()
        {
            var vm = new MainWindowVM();

            Assert.IsNotNull(vm.CommandExit);
            Assert.IsNotNull(vm.CommandAddProduct);
            Assert.IsNotNull(vm.CommandEditProduct);
            Assert.IsNotNull(vm.CommandDeleteProduct);
        }

        [TestMethod]
        public void Constructor_Default_ShouldSetUserFullNameToGuest()
        {
            var vm = new MainWindowVM();

            Assert.AreEqual("ГОСТЕВАЯ УЧЁТНАЯ ЗАПИСЬ", vm.UserFullName);
        }

        [TestMethod]
        public void IsAdminPanelVisible_ForGuest_ShouldBeFalse()
        {
            var vm = new MainWindowVM();

            Assert.IsFalse(vm.IsAdmin);
        }
    }
}
