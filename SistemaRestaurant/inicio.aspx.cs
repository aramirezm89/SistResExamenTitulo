using CapaEntidad;
using CapaNegocio;
using CapaPersistencia;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaRestaurant
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { NegCliente negCli = new NegCliente();
                dpCli.DataTextField = "Rut";
                dpCli.DataValueField = "Id_cliente";
                dpCli.DataSource = negCli.listarCLientes();
                dpCli.DataBind();


                NEGPedido negPedido = new NEGPedido();
                dpNumeroPedido.DataValueField = "NumeroPedido";
                dpNumeroPedido.DataValueField = "NumeroPedido";
                dpNumeroPedido.DataSource = negPedido.listarPedidos();
                dpNumeroPedido.DataBind();


                NEGProducto negProducto = new NEGProducto();

                dpCodigoPro.DataTextField = "CodigoProducto";
                dpCodigoPro.DataValueField = "CodigoProducto";
                dpCodigoPro.DataSource = negProducto.listarProductos();
                dpCodigoPro.DataBind();

            }

         
        }

        protected void btnRegistraCLi_Click(object sender, EventArgs e)
        {

            Cliente cliente = new Cliente();

            cliente.Nombre = txtNombre.Text;
            cliente.Apellido1 = txtApellido1.Text;
            cliente.Apellido2 = txtApellido2.Text;
            cliente.Rut = txtRut.Text;
            cliente.Estado = dpEstado.Text;


            if (txtRut.Text.Equals("") || txtNombre.Text.Equals("") || txtApellido1.Text.Equals("") || txtApellido2.Text.Equals(""))
            {
                Response.Write("<script>alert('Todos los campos son obligatiorios.')</script>");
            }
            else
            {

                if (ValidaRut(txtRut.Text))
                {

                    NegCliente negCli = new NegCliente();

                    bool registro = negCli.registroCliente(cliente);

                    if (registro)
                    {
                        Response.Write("<script>alert('Cliente guardado con exito.')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error, no se pudo guardar el cliente, verifique el rut del cliente.')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('rut erroneo.')</script>");
                }
            }



          
        }



        public static bool ValidaRut(string rut)
        {
            rut = rut.Replace(".", "").ToUpper();
            Regex expresion = new Regex("^([0-9]+-[0-9K])$");
            string dv = rut.Substring(rut.Length - 1, 1);
            if (!expresion.IsMatch(rut))
            {
                return false;
            }
            char[] charCorte = { '-' };
            string[] rutTemp = rut.Split(charCorte);
            if (dv != Digito(int.Parse(rutTemp[0])))
            {
                return false;
            }
            return true;
        }

        public static string Digito(int rut)
        {
            int suma = 0;
            int multiplicador = 1;
            while (rut != 0)
            {
                multiplicador++;
                if (multiplicador == 8)
                    multiplicador = 2;
                suma += (rut % 10) * multiplicador;
                rut = rut / 10;
            }
            suma = 11 - (suma % 11);
            if (suma == 11)
            {
                return "0";
            }
            else if (suma == 10)
            {
                return "K";
            }
            else
            {
                return suma.ToString();
            }
        }

        protected void btnPedido_Click(object sender, EventArgs e)
        {
            try
            {
                Pedido pedido = new Pedido();

                Cliente cliente = new Cliente();

                cliente.Id_cliente = int.Parse(dpCli.SelectedValue);

                pedido.Cliente = cliente;
             
                pedido.Fecha = DateTime.Parse(txtFecha.Text);

                NEGPedido negPedido = new NEGPedido();

                bool registro = negPedido.registroPedido(pedido);

                if (registro)
                {
                    Response.Write("<script>alert('Pedido guardado con exito.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error, no se pudo guardar el pedido.')</script>");
                }

            }
            catch (Exception)
            {

                Response.Write("<script>alert('Error, no se pudo guardar el pedido.')</script>");
            }

        }

        protected void dpCodigoPro_SelectedIndexChanged(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            string condicion = dpCodigoPro.Text;
            string query = "SELECT * FROM TBL_productos Where codigoProducto =  "+condicion;
            conexion.abrirConexion();
            SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);

            conexion.cerrarConexion();

            if (tabla.Rows.Count > 0)
            {

                for (int i = 0; i < tabla.Rows.Count; i++)
                {
                    Producto producto = new Producto();

                    producto.CodigoProducto = int.Parse(tabla.Rows[i]["codigoProducto"].ToString());
                    producto.Descripcion = tabla.Rows[i]["descripcion"].ToString();
                    producto.PreocioUnitario = int.Parse(tabla.Rows[i]["precioUnitario"].ToString());

                    txtDescripcion.Text = producto.Descripcion.ToString();
                    txtPrecio.Text = producto.PreocioUnitario.ToString();
                }

            }

         }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicio.aspx");
        }

        protected void btnRegistraDetalle_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCantidad.Text.Equals(""))
                {
                    Response.Write("<script>alert('Error, no se pudo guardar el detalle, debe ingresar la cantidad del producto')</script>");
                }else if (txtCantidad.Text.Length >2)
                {
                    Response.Write("<script>alert('Error, no se pudo guardar el detalle, la cantidad del producto excede el maximo de 2 cifras')</script>");
                }else if (int.Parse(txtCantidad.Text) <=0)
                {
                    Response.Write("<script>alert('Error, La cantidad del producto debe ser mayor a 0')</script>");
                }
                else
                {


                    Detalle detalle = new Detalle();

                    Pedido pedido = new Pedido();

                    pedido.NumeroPedido = int.Parse(dpNumeroPedido.Text);

                    detalle.Pedido = pedido;

                    Producto producto = new Producto();

                    producto.CodigoProducto = int.Parse(dpCodigoPro.Text);

                    detalle.Producto = producto;



                    detalle.CantidadProducto = int.Parse(txtCantidad.Text);


                    conexionBD conexion = new conexionBD();
                    SqlConnection cnn = conexion.abrirConexion();
                    SqlCommand cmdSelect = cnn.CreateCommand();
                    cmdSelect.CommandText = "SP_BuscaEstadoCliente";
                    cmdSelect.CommandType = CommandType.StoredProcedure;
                    cmdSelect.Parameters.AddWithValue("@in_numeroPedido", pedido.NumeroPedido);
                    SqlDataReader lector = cmdSelect.ExecuteReader();


                    if ((lector.Read() == true && lector["estado"].Equals("Frecuente")))
                    {

                        int total = (detalle.CantidadProducto * int.Parse(txtPrecio.Text));

                        int descuento = total * 10 / 100;

                        detalle.Total = total - descuento;

                    }
                    else
                    {
                        lector.Close();
                        detalle.Total = detalle.CantidadProducto * int.Parse(txtPrecio.Text);

                    }

                    txtTotal.Text = detalle.Total.ToString();

                    NEGDetalle negDetalle = new NEGDetalle();
                    
                    bool registroDetalle = negDetalle.registraDetalle(detalle);

                    if (registroDetalle)
                    {
                       
                        Response.Write("<script>alert('Detalle guardado con exito.')</script>");

                    }
                    else
                    {
                        Response.Write("<script>alert('Error, no se pudo guardar el detalle. Revise los datos ingresados')</script>");
                    }
                    ListaDetalle(gridDetalle);
                    TotalCompra(txtTotalCompra);
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Error, no se pudo guardar el detalle. Revise los datos ingresados')</script>");
            }

        }

        protected void btnActPedido_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicio.aspx");
        }

        public void ListaDetalle(GridView data)
        {
            conexionBD conexion = new conexionBD();
            try
            { 
                SqlDataAdapter adaptador = new SqlDataAdapter("SP_BuscaDetalle", conexion.Conexion);
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.AddWithValue("@in_numeroPedido", dpNumeroPedido.Text);
                DataTable tabla = new DataTable();
                adaptador.Fill(tabla);
                data.DataSource = tabla;
                data.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                conexion.cerrarConexion();
            }

        }
        public void TotalCompra(TextBox txt)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                SqlDataAdapter adaptador = new SqlDataAdapter("SP_TotalizaCompra", conexion.Conexion);
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.AddWithValue("@in_numeroPedido", dpNumeroPedido.Text);
                DataTable tabla = new DataTable();
                adaptador.Fill(tabla);

                if (tabla.Rows.Count > 0)
                {

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {

                        string totalCompra = "";
                        totalCompra = tabla.Rows[i]["total"].ToString();
                        txt.Text = $"${totalCompra}";
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }


   
}