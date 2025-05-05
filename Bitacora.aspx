<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Bitacora.aspx.vb" Inherits="Bitacora" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col">
                <h2 class="text-primary"><i class="fas fa-clipboard-list me-2"></i>Bitácora de Cambios</h2>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-history me-2"></i>Registros de Actividad</h5>
            </div>
            <div class="card-body">
                <div class="gridview-container">
                    <asp:GridView ID="gvBitacora" runat="server" 
                        CssClass="table table-hover table-striped" 
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        PageSize="10"
                        OnPageIndexChanging="gvBitacora_PageIndexChanging"
                        AllowCustomPaging="True"
                        PagerStyle-CssClass="pagination"
                        PagerSettings-Mode="NumericFirstLast"
                        PagerSettings-Position="Bottom"
                        PagerSettings-PageButtonCount="5"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-CssClass="fw-bold" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                            <asp:BoundField DataField="NombreCliente" HeaderText="Cliente" />
                            <asp:BoundField DataField="Accion" HeaderText="Acción" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                        </Columns>
                        <HeaderStyle CssClass="table-primary" />
                        <RowStyle CssClass="align-middle" />
                        <PagerStyle HorizontalAlign="Center" CssClass="pagination" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
