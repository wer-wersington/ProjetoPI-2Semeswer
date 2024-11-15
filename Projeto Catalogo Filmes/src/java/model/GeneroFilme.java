/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import Controller.ConectarDao;
import Controller.IcrudDao;
import java.sql.SQLException;

/**
 *
 * @author wersington.sssacrame
 */
public class GeneroFilme extends ConectarDao implements IcrudDao {
    
   public int idFilme; 
   public int idGenero;

    public int getIdFilme() {
        return idFilme;
    }

    public void setIdFilme(int idFilme) {
        this.idFilme = idFilme;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }
    
    public void incluir(){
     try { sql = "insert into TB_GENERO_FILME (ID_FILME, ID_GENERO)"
        + "values (?,?)";
    ps = con.prepareStatement(sql);
    ps.setInt(1, idFilme); // Configura Parametros
    ps.setInt(2,idGenero); // Configura Parametros
    ps.executeUpdate(); // executa comando SQL
 this.statusSQL = null; // armazena null se deu tudo certo
 } catch (SQLException ex) {
 this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
 }
     
    }
    
     public int buscarUltimoFilme() throws SQLException{
         sql = "SELECT * FROM TB_FILME ORDER BY ID_FILME DESC LIMIT 1;";
         ps = con.prepareStatement(sql);
         tab = ps.executeQuery();
         
         if(tab.next()){
            return idFilme = tab.getInt("ID_FILME");
         }
         return 0;
   }

    @Override
    public boolean salvar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean buscar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean buscarSQL() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
