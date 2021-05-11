using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace SistemaRestaurant
{
    public partial class venta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VistaVentaTotal();
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            DataTable tabla  = new DataTable();
            Document documento = new Document();
            PdfWriter escritor = PdfWriter.GetInstance(documento, HttpContext.Current.Response.OutputStream);
            tabla = ExportarPDF();
            if(tabla.Rows.Count > 0)
            {
                documento.Open();
                Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                Font font14 = FontFactory.GetFont(FontFactory.TIMES, 14);

                PdfPTable tablaPDF = new PdfPTable(tabla.Columns.Count);
                documento.Add(new Paragraph(20, "      "+"Productos más vendidos", fontTitle));
                documento.Add(new Chunk("\n"));

                float[] widths = new float[tabla.Columns.Count];
                for (int i = 0; i < tabla.Columns.Count; i++)
                    widths[i] = 4f;

                tablaPDF.SetWidths(widths);
                tablaPDF.WidthPercentage = 90;

                PdfPCell celda = new PdfPCell(new Phrase("columns"));
                celda.Colspan = tabla.Columns.Count;

                foreach (DataColumn item in tabla.Columns)
                {
                    tablaPDF.AddCell(new Phrase(item.ColumnName, font14));
                }

                foreach (DataRow fila in tabla.Rows)
                {
                    if(tabla.Rows.Count > 0)
                    {
                        for (int j = 0; j < tabla.Columns.Count; j++)
                        {
                            tablaPDF.AddCell(new Phrase(fila[j].ToString(), font14));
                        }
                    }
                }


                documento.Add(tablaPDF);

            }
            documento.Close();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Reporte de productos mas vendidos" + ".pdf");
            HttpContext.Current.Response.Write(documento);
            Response.Flush();
            Response.End();
        }

        public void VistaVentaTotal()
        {
            DataTable tabla;
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT  * FROM V_ProductosMasVendidos";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                tabla = new DataTable();

                tabla.Columns.Add("codigoProducto");
                tabla.Columns.Add("descripcion");
                tabla.Columns.Add("vendidos");


                adaptador.Fill(tabla);

                

                gridVentaTotal.DataSource = tabla;
                gridVentaTotal.DataBind();
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

        public DataTable ExportarPDF()
        {
            DataTable tabla;
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT  * FROM V_ProductosMasVendidos";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                tabla = new DataTable();

                tabla.Columns.Add("codigoProducto");
                tabla.Columns.Add("descripcion");
                tabla.Columns.Add("vendidos");


                adaptador.Fill(tabla);

               

                return tabla;
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
            
    }
}