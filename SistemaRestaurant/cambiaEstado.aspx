<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="cambiaEstado.aspx.cs" Inherits="SistemaRestaurant.cambiaEstado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
          <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px;margin-bottom:30px;">Cambia estado del cliente</h1>
            <small> Para cambiar el estado del cliente favor ingresar la ID_CLIENTE y presione el boton Cambiar Estado.</small>
        </div>
           </header>
    </div>

    <div class="container" style="margin-top:40px;">
       <div class="row">
           <div class="col-5 container form-inline">
               <asp:TextBox ID="txtIdCli" MaxLength="50" runat="server" placeholder="id_cliente" CssClass="form-control"></asp:TextBox>
               <asp:Button ID="btnCambiaEstado" style="margin-left:10px" CssClass="btn btn-primary" OnClick="btnCambiaEstado_Click" runat="server" Text="Cambiar Estado" />
           </div>
       </div>
    </div>
  
</asp:Content>
