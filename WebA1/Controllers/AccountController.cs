using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebA1.Models.New_model;

namespace WebA1.Controllers

{
   
    public class AccountController : Controller
    {
        NFT2Entities db = new NFT2Entities();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult login(Customer avm)
        {
            Customer ad = db.Customers.Where(x => x.User_Name == avm.User_Name && x.Password == avm.Password).SingleOrDefault();
            if (ad != null)
            {

                Session["Customer Id"] = ad.Customer_Id.ToString();
                return RedirectToAction("Product","Product");

            }
            else
            {
                ViewBag.error = "Invalid username or password";
                return View();
            }

            
        }

        // CREATE: Customer

        public ActionResult RegisterCustomer()
        {
            return View();
        }

        [HttpPost]

        public ActionResult RegisterCustomer(Customer cvm)
        {

            if (ModelState.IsValid)
            {
                if (cvm.User_Name != null)
                {

                    Customer c = new Customer
                    {
                        Customer_Id = cvm.Customer_Id,
                        User_Name = cvm.User_Name,
                        Password = cvm.Password,
                        Email = cvm.Email,
                    };

                    return RedirectToAction("Login", "Account");
                }
            }
            return PartialView("_Error");
        }
        public ActionResult Logout()
        {
            Session["UserInfo"] = null;
            Session.Abandon();
            return RedirectToAction("Your login or exit screen", "Your action");
        }

    }



}

    
