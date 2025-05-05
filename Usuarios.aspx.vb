Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Security.Cryptography
Imports System.Text
Imports GestionClientesApp

Partial Class Usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UsuarioId") Is Nothing Then
                Response.Redirect("Login.aspx")
            End If
            CargarUsuarios()
        End If
    End Sub

    Private Sub CargarUsuarios()
        Using conn = Conexion.ObtenerConexion()
            Dim cmd As New SqlCommand("SELECT Id, NombreUsuario FROM Usuarios WHERE Activo = 1", conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            gvusuarios.DataSource = reader
            gvusuarios.DataBind()
        End Using
    End Sub

    Protected Sub btnAgregarUsuario_Click(sender As Object, e As EventArgs)
        Dim usuario As String = txtNuevoUsuario.Text.Trim()
        Dim clave As String = txtNuevaClave.Text.Trim()
        Dim confirmarClave As String = txtConfirmarClave.Text.Trim()

        If usuario = "" Or clave = "" Then Exit Sub
        If Not String.Equals(clave, confirmarClave, StringComparison.Ordinal) Then Exit Sub

        Dim hash As String = Seguridad.HashPassword(clave)

        Using conn = Conexion.ObtenerConexion()
            Dim cmdCheck As New SqlCommand("SELECT Id FROM Usuarios WHERE NombreUsuario = @Usuario", conn)
            cmdCheck.Parameters.AddWithValue("@Usuario", usuario)
            conn.Open()
            Dim existingUserId As Object = cmdCheck.ExecuteScalar()

            If existingUserId IsNot Nothing Then
                Dim cmdUpdate As New SqlCommand("UPDATE Usuarios SET Activo = 1, ContrasenaHash = @Clave WHERE Id = @Id", conn)
                cmdUpdate.Parameters.AddWithValue("@Clave", hash)
                cmdUpdate.Parameters.AddWithValue("@Id", Convert.ToInt32(existingUserId))
                cmdUpdate.ExecuteNonQuery()
            Else
                Dim cmdInsert As New SqlCommand("INSERT INTO Usuarios (NombreUsuario, ContrasenaHash) VALUES (@Usuario, @Clave)", conn)
                cmdInsert.Parameters.AddWithValue("@Usuario", usuario)
                cmdInsert.Parameters.AddWithValue("@Clave", hash)
                cmdInsert.ExecuteNonQuery()
            End If
        End Using

        txtNuevoUsuario.Text = ""
        txtNuevaClave.Text = ""
        CargarUsuarios()
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Dim btn As Button = CType(sender, Button)
        Dim id As Integer = Convert.ToInt32(btn.CommandArgument)

        Using conn = Conexion.ObtenerConexion()
            Dim cmd As New SqlCommand("UPDATE Usuarios SET Activo = 0 WHERE Id = @Id", conn)
            cmd.Parameters.AddWithValue("@Id", id)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using

        CargarUsuarios()
    End Sub
End Class
