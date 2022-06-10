using MvcLaundryCrudProject.Models;
using System.Data.Entity;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MvcLaundryCrudProject.Controllers
{
    public class AdminsController : Controller
    {
        private LaundryDBEntities db = new LaundryDBEntities();

        public async Task<ActionResult> AdminIndex()
        {
            AllInOneClass AllClassinHere = new AllInOneClass();
            AllClassinHere.CustomerCount = await db.Admins.CountAsync();
            AllClassinHere.ServicesCount = await db.Services.CountAsync();
            AllClassinHere.CategoriesCount = await db.Categories.CountAsync();
            AllClassinHere.MoneyCount = (int)await db.Categories.SumAsync(c => c.Price);

            return View(AllClassinHere);
        }
        public async Task<ActionResult> Index()
        {
            return View(await db.Admins.ToListAsync());
        }

        // GET: Admins/Create
        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "AdminId,userName,password")] Admins admins)
        {
            if (ModelState.IsValid)
            {
                db.Admins.Add(admins);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(admins);
        }

        // GET: Admins/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Admins admins = await db.Admins.FindAsync(id);
            if (admins == null)
            {
                return HttpNotFound();
            }
            return View(admins);
        }

        // POST: Admins/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "AdminId,userName,password")] Admins admins)
        {
            if (ModelState.IsValid)
            {
                db.Entry(admins).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(admins);
        }

        // GET: Admins/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Admins admins = await db.Admins.FindAsync(id);
            if (admins == null)
            {
                return HttpNotFound();
            }
            return View(admins);
        }

        // POST: Admins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Admins admins = await db.Admins.FindAsync(id);
            db.Admins.Remove(admins);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
