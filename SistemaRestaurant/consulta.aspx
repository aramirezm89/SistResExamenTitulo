<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="consulta.aspx.cs" Inherits="SistemaRestaurant.consulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
          <header>
        <div class="container header">
            <h1 style="text-align:center;margin-top:20px;margin-bottom:30px;">Pedidos realizados</h1>
            <small>Despues de realizar un filtro si deseas ver nuevamente la tabla completa, debes dejar en blanco el campo Filtro nombre cliente y
                presionar el boton Buscar.
            </small>
        </div>
           </header>
    </div>
  

    <div class="container" style="margin-top:40px;align-content:center!important">
     <div class="row">
        <div class="col-6" >
            <asp:Label ID="lblFiltroNombre" AssociatedControlID="txtFiltroNombre" runat="server" Text="Filtro nombre cliente"></asp:Label>
             <asp:TextBox ID="txtFiltroNombre" MaxLength="50" runat="server"></asp:TextBox>
             <asp:Button ID="btnFiltroNombre" CssClass="btn btn-primary" OnClick="btnFiltroNombre_Click"  runat="server" Text="Buscar" />
        </div>
        <div class="col-6" >
            <asp:Label ID="lblFiltroEstado" AssociatedControlID="DpFiltroEstado" runat="server" Text="Estado cliente"></asp:Label>
            <asp:DropDownList ID="DpFiltroEstado"  runat="server">
                <asp:ListItem>Nuevo</asp:ListItem>
                <asp:ListItem>Frecuente</asp:ListItem>
            </asp:DropDownList>
             <asp:Button ID="btnFiltroEstado"  CssClass="btn btn-primary" OnClick="btnFiltroEstado_Click" runat="server" Text="Buscar" />
        </div>

    </div>
 </div>

       
   <div class="container" style="margin-top:30px">
        <asp:GridView ID="gridPedidos" RowStyle-Wrap="false" CssClass="table table-striped table-bordered table-sm  text-center"  runat="server"></asp:GridView>
   </div>
</asp:Content>
