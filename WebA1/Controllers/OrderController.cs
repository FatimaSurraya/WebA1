using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using WebA1.Models.New_model;
using System.Threading.Tasks;
using System.Text;

namespace WebA1.Controllers
{
    public class OrderController : Controller
    {
        NFT2Entities db = new NFT2Entities();
        // GET: Order
        public async Task<ActionResult> Order()
        {
            List<Order> Orders = new List<Order>();
            using (var client = new HttpClient())
            {
                //Passing service base url
                client.BaseAddress = new Uri("https://localhost:44399/");
                client.DefaultRequestHeaders.Clear();
                //Define request data format
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //Sending request to find web api REST service resource GetAllEmployees using HttpClient
                HttpResponseMessage Res = await client.GetAsync("api/OrderAPI/Order");
                //Checking the response is successful or not which is sent using HttpClient
                if (Res.IsSuccessStatusCode)
                {
                    //Storing the response details recieved from web api
                    var response = Res.Content.ReadAsStringAsync().Result;
                    //Deserializing the response recieved from web api and storing into the Employee list
                    Orders = JsonConvert.DeserializeObject<List<Order>>(response);
                    return View(Orders);
                }
                //returning the employee list to view
                return View(Orders);
            }
        }
        // POST: Order/PlaceOrder
        [HttpPost]
        public async Task<ActionResult> Order(Order order)
        {
            if (ModelState.IsValid)
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44399/");
                    client.DefaultRequestHeaders.Clear();
                    //Define request data format
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    var json = JsonConvert.SerializeObject(order);
                    var data = new StringContent(json, Encoding.UTF8, "application/json");
                    //Sending request to find web api REST service resource GetAllEmployees using HttpClient
                    HttpResponseMessage Res = await client.PostAsync("api/OrderAPI/Order1", data);

                }
                // Redirect to the confirmation page
                return RedirectToAction("Order");
            }

            // If the model is not valid, redisplay the form with error messages
            return View(order);
        }

        // GET: Order/OrderConfirmation
        public ActionResult OrderConfirmation()
        {
            // Display the order confirmation page to the user
            return View();
        }

        private void SaveOrderToDatabase(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            // Code to save the order to the database
        }
    }
}