Imports System.Data.SqlClient

Public Class Conexion
    Public Shared Function ObtenerConexion() As SqlConnection
        Dim connStr As String = ConfigurationManager.ConnectionStrings("ConexionSQL").ConnectionString
        Return New SqlConnection(connStr)
    End Function
End Class
