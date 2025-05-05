Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports GestionClientesApp

Public Class Bitacora
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UsuarioId") Is Nothing Then
                Response.Redirect("Login.aspx")
            End If
            gvBitacora.PageIndex = 0
            CargarBitacora()
        End If
    End Sub

    Protected Sub gvBitacora_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvBitacora.PageIndex = e.NewPageIndex
        CargarBitacora()
    End Sub

    Private Sub CargarBitacora()
        Dim pageSize As Integer = gvBitacora.PageSize
        Dim currentPage As Integer = gvBitacora.PageIndex

        Using conn = Conexion.ObtenerConexion()
            ' Main data query with OFFSET-FETCH
            Dim cmd As New SqlCommand("
               SELECT B.Id, U.NombreUsuario, C.Nombre AS NombreCliente, B.Accion, B.Fecha
               FROM Bitacora B
               INNER JOIN Usuarios U ON B.UsuarioId = U.Id
               INNER JOIN Clientes C ON B.ClienteId = C.Id
               ORDER BY B.Fecha DESC
               OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY", conn)

            cmd.Parameters.AddWithValue("@Offset", currentPage * pageSize)
            cmd.Parameters.AddWithValue("@PageSize", pageSize)

            ' Get total count
            Dim countCmd As New SqlCommand("
                SELECT COUNT(*)
                FROM Bitacora B
                INNER JOIN Usuarios U ON B.UsuarioId = U.Id
                INNER JOIN Clientes C ON B.ClienteId = C.Id", conn)

            conn.Open()
            Dim totalRecords As Integer = Convert.ToInt32(countCmd.ExecuteScalar())

            ' Bind data
            Dim adapter As New SqlDataAdapter(cmd)
            Dim table As New DataTable()
            adapter.Fill(table)

            gvBitacora.DataSource = table
            gvBitacora.VirtualItemCount = totalRecords

            ' Explicitly set PageCount (this is the key fix)
            Dim pageCount As Integer = CInt(Math.Ceiling(totalRecords / CDbl(pageSize)))
            gvBitacora.PagerSettings.Visible = (pageCount > 1)

            gvBitacora.DataBind()
        End Using
    End Sub
End Class