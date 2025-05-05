Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UsuarioId") IsNot Nothing Then
                Response.Redirect("Dashboard.aspx")
            End If
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Dim usuario = txtUsuario.Text.Trim()
        Dim passwordHash = Seguridad.HashPassword(txtPassword.Text.Trim())

        Using conn = Conexion.ObtenerConexion()
            conn.Open()
            Dim cmd = New SqlCommand("SELECT Id FROM Usuarios WHERE NombreUsuario=@usuario AND ContrasenaHash=@pass AND Activo = 1", conn)
            cmd.Parameters.AddWithValue("@usuario", usuario)
            cmd.Parameters.AddWithValue("@pass", passwordHash)

            Dim reader = cmd.ExecuteReader()
            If reader.Read() Then
                Session("UsuarioId") = reader("Id")
                Session("NombreUsuario") = usuario
                Response.Redirect("Dashboard.aspx")
            Else
                lblError.Text = "Credenciales incorrectas"
            End If
        End Using
    End Sub


End Class