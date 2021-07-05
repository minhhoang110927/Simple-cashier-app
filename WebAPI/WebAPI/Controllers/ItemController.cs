using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class ItemController : ApiController
    {
        private DBModel db = new DBModel();

        // GET: api/Item
        
        public System.Object GetItem()
        {
            var result = (from a in db.Items
                          select new
                          {
                              a.ItemID,
                              a.Name,
                              a.Price
                          }).ToList();
            return result;
        }

        // GET: api/Item/5
        [ResponseType(typeof(Item))]
        public IHttpActionResult GetItem(int id)
        {
            var item = (from a in db.Items
                        where a.ItemID == id
                        select new
                        {
                            a.ItemID,
                            a.Name,
                            a.Price,
                            DeleteItemIDs = ""
                        }).ToList();
            return Ok(new { item });
        }


        // POST: api/Item
        [ResponseType(typeof(Item))]
        public IHttpActionResult PostItem(Item item)
        {
            try
            {
                if (item.ItemID == 0)
                    db.Items.Add(item);
                else
                    db.Entry(item).State = EntityState.Modified;
                db.SaveChanges();
                return Ok();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // DELETE: api/Item/5
        [ResponseType(typeof(Item))]
        public IHttpActionResult DeleteItem(int id)
        {
            Item item = db.Items.SingleOrDefault(x => x.ItemID == id);
            db.Items.Remove(item);
            db.SaveChanges();
            return Ok(item);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ItemExists(int id)
        {
            return db.Items.Count(e => e.ItemID == id) > 0;
        }
    }
}