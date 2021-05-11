<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="venta.aspx.cs" Inherits="SistemaRestaurant.venta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
     <div class="container">
       <header>
            <div class="container header">
                <h1 style="text-align:center;margin-top:20px;margin-bottom:30px;">Productos más vendidos</h1>
            </div>
        </header>
    </div>
    
    <div class="container" style="margin-top:30px">
        <asp:GridView ID="gridVentaTotal" RowStyle-Wrap="false" CssClass="table table-striped table-bordered table-sm  text-center"  runat="server"></asp:GridView>
        <asp:Button ID="btnPDF" runat="server" CssClass="btn-primary" OnClick="btnPDF_Click" Text="Exportar PDF" />
   </div>
</asp:Content>
