using MvcLaundryCrudProject.Models;
using System.Data.Entity;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Security;

namespace MvcLaundryCrudProject.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {

        private LaundryDBEntities db = new LaundryDBEntities();

        public ActionResult Index()
        {
            return View();
        }
        //[Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Services()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult LoginPage()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> LoginPage(Admins admin)
        {

            bool activeAdmin = await db.Admins.AnyAsync(x => x.userName == admin.userName && x.password == admin.password);
            //var userInDb = db.Admins.FirstOrDefaultAsync(x => x.userName == admin.userName && x.password == admin.password);
            if (activeAdmin)
            {                    //dll eklendi
                FormsAuthentication.SetAuthCookie(admin.userName, false);
                return RedirectToAction("AdminIndex", "Admins");

            }
            else
            {
                ViewBag.Mesaj = "Böyle bir kullanıcı yok. Kullanıcı adı veya şifre geçersiz.";
                return View();
            }

        }
        public ActionResult LogoutPage()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("LoginPage", "Home");
        }
    }
}