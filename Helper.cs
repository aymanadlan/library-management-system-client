﻿using library_management_system_client.Models;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Http;
using System.Text;
using System.Web.Script.Serialization;

namespace library_management_system_client
{
    public static class Helper
    {
        public static List<Book> Populate()
        {
            // Reads the library-management-api-azure-url value from Web.config filw
            string apiUrl = ConfigurationManager.AppSettings["library-management-api-azure-url"];

            HttpClient client = new HttpClient();

            HttpResponseMessage response = client.GetAsync(apiUrl + "/get-all-books").Result;

            if (response.IsSuccessStatusCode)
            {
                List<Book> books = (new JavaScriptSerializer()).Deserialize<List<Book>>(response.Content.ReadAsStringAsync().Result);

                return books;
            }
            else
            {
                return new List<Book>();
            }
        }
        public static void Add(string name, string decription, string price)
        {
            string apiUrl = "https://localhost:7163/api/Books";
            var input = new Book()
            {
                Name = name.Trim(),
                Description=decription.Trim(),
                Price=100
            };
            string inputJson = (new JavaScriptSerializer()).Serialize(input);
            HttpClient client = new HttpClient();
            HttpContent inputContent = new StringContent(inputJson, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PostAsync(apiUrl + "/add-new-book", inputContent).Result;

        }
        public static void Update(int id, string name, string decription, string price)
        {
            string apiUrl = "https://localhost:7163/api/Books";
            var input = new Book()
            {
                Id=id,
                Name = name.Trim(),
                Description = decription.Trim(),
                Price = 100
            };
            string inputJson = (new JavaScriptSerializer()).Serialize(input);
            HttpClient client = new HttpClient();
            HttpContent inputContent = new StringContent(inputJson, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PutAsync( $"{apiUrl}/update-book/{id}", inputContent).Result;

        }
        public static void Delete(int id)
        {
            string apiUrl = "https://localhost:7163/api/Books";
           
            HttpClient client = new HttpClient();
            HttpResponseMessage response = client.DeleteAsync($"{apiUrl}/delete-book/{id}").Result;

        }
    }
}