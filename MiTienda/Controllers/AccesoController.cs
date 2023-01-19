using MiTienda.Logica;
using MiTienda.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MiTienda.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string NCorreo, string NContrasena)
        {
            
            Usuario oUsuario = new Usuario();

            oUsuario = UsuarioLogica.Instancia.Obtener(NCorreo, NContrasena);

            if (oUsuario == null)
            {
                ViewBag.Error = "Credenciales incorrectas";
                return View();
            }

            FormsAuthentication.SetAuthCookie(oUsuario.Correo, false);
            Session["Usuario"] = oUsuario;
            ViewBag.IdUsuario = oUsuario.IdUsuario;
            ViewBag.Nombre = oUsuario.Nombres + " " + oUsuario.Apellidos;

            if (oUsuario.EsAdministrador == true)
            {
                return RedirectToAction("Index", "Panel");
            }
            else {
                return RedirectToAction("Index", "Carrito");
            }

            
        }

        // GET: Acceso
        public ActionResult Registrarse()
        {
            return View(new Usuario() { Nombres= "",Apellidos= "",Correo="",Contrasena="",ConfirmarContrasena="" });
        }

        [HttpPost]
        public ActionResult Registrarse(string NNombres, string NApellidos, string NCorreo, string NContrasena, string NConfirmarContrasena)
        {
            Usuario oUsuario = new Usuario()
            {
                Nombres = NNombres,
                Apellidos = NApellidos,
                Correo = NCorreo,
                Contrasena = NContrasena,
                ConfirmarContrasena = NConfirmarContrasena,
                EsAdministrador = false
            };

            if (NContrasena != NConfirmarContrasena)
            {
                ViewBag.Error = "Las contraseñas no coinciden";
                return View(oUsuario);
            }
            else {
                

                int idusuario_respuesta = UsuarioLogica.Instancia.Registrar(oUsuario);

                if (idusuario_respuesta == 0)
                {
                    ViewBag.Error = "Error al registrar";
                    return View();

                }
                else {
                    return RedirectToAction("Index", "Acceso");
                }
            }
        }

    }

}