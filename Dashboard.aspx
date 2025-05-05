<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Panel Principal</h2>

        <div class="row justify-content-center">
            <div class="col-md-4">
                <a href="Clientes.aspx" class="btn btn-primary btn-block btn-lg w-100 mb-3">Clientes</a>
            </div>
            <div class="col-md-4">
                <a href="Bitacora.aspx" class="btn btn-secondary btn-block btn-lg w-100 mb-3">Bitácora</a>
            </div>
            <div class="col-md-4">
                <a href="Usuarios.aspx" class="btn btn-success btn-block btn-lg w-100 mb-3">Usuarios</a>
            </div>
        </div>
    </div>
</asp:Content>

