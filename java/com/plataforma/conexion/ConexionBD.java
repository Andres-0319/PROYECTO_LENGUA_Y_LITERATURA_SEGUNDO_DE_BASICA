package com.plataforma.conexion;

import java.sql.*;

public class ConexionBD {
	private Statement St; 
    private String driver;
    private String user;
    private String pwd;
    private String cadena;
    private Connection con;

    String getDriver() {
        return this.driver;
    }
    String getUser() {
        return this.user;
    }
    String getPwd() {
        return this.pwd;
    }
    String getCadena() {
        return this.cadena;
    }
    public Connection getConexion() { 
        return this.con; 
    }
    
    public ConexionBD() {
        this.driver = "org.postgresql.Driver";
        
        String ipServidorDocente = "172.17.42.121";
        
        boolean esEntornoLocal = true; 
        
        if (esEntornoLocal) {
            this.user = "postgres";
            this.pwd = "burgos";
            this.cadena = "jdbc:postgresql://localhost:5432/LENGUA_BBAA";
        } else {
            this.user = "alumno";
            this.pwd = "1234";
            this.cadena = "jdbc:postgresql://" + ipServidorDocente + ":5432/LENGUA_BBAA";
        }
        
        this.con = this.crearConexion();    
    }
    
    Connection crearConexion() {
        try {
            Class.forName(getDriver());
            Connection con = DriverManager.getConnection(getCadena(), getUser(), getPwd());
            System.out.println("¡CONEXIÓN EXITOSA A POSTGRESQL EN: " + getCadena() + "!");
            return con;
        } catch (Exception ee) {
            System.out.println("Error en conexión: " + ee.getMessage());
            return null;
        }
    }
    
    public String Ejecutar(String sql) {
        String result = "";
        try {
            St = getConexion().createStatement();
            int filas_Afectadas = St.executeUpdate(sql);
            if (filas_Afectadas >= 0) {
                result = "Operacion realizada con exito";
            } else {
                result = "Se ha producido un error";
            }
        } catch (Exception ex) {
            result = "Error: " + ex.getMessage();
        }
        return result;
    }
    
    public ResultSet Consulta(String sql) {
        ResultSet reg = null;
        try {
            St = getConexion().createStatement();
            reg = St.executeQuery(sql);
        } catch (Exception ee) {
            System.out.println("Error en consulta SELECT: " + ee.getMessage());
        }
        return reg;
    }
}