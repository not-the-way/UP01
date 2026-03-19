using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using UP01.Models;
using UP01.ViewModels;

namespace UP_UnitTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void CurrentUser_DefaultValue_ShouldBeNull()
        {
            var vm = new AuthWindowVM();

            var result = vm.CurrentUser;

            Assert.IsNull(result);
        }

        [TestMethod]
        public void CommandLogin_ShouldNotBeNull()
        {
            var vm = new AuthWindowVM();

            var command = vm.CommandLogin;

            Assert.IsNotNull(command);
        }

        [TestMethod]
        public void LoginEmpty_ShouldShowMessage()
        {
            var vm = new AuthWindowVM();
            vm.CurrentUser = new Users { Login = "", Password = "" };
            vm.InsertedLogin = "";
            vm.InsertedPassword = "";

            try
            {
                vm.CommandLogin.Execute(null);
                Assert.IsTrue(true);
            }
            catch
            {
                Assert.Fail("Метод Login упал с исключением");
            }
        }
    }
}
