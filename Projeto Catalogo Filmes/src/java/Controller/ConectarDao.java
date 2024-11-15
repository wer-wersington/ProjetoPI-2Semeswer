/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.sql.DriverManager; // Driver para abrir Conexão
import java.sql.ResultSet;
import java.sql.SQLException; // Tratamento de Erros SQL
import java.sql.Connection; // Armazena a Conexão Aberta
import java.sql.PreparedStatement;

public class ConectarDao {

    public Connection con = null;
    public String sql = null;
    public PreparedStatement ps = null;
    public String htmlError = null;
    public ResultSet tab = null;
    public String MeuBanco = "catalogofilms";
    public String statusSQL; 
    public int gravado = 0;
    /* Na variável statusSQl conterá null quando não tiver erros
Mas quando haver erros conterá a mensagem de erro capturada
Pela excessão da clausula try. */

    public ConectarDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "");
            criarBanco();
            statusSQL = null;
        } catch (ClassNotFoundException ex) {
            htmlError = "Driver JDBC não encontrado! " + ex.getMessage();
        } catch (SQLException ex) {
            htmlError = "Servidor fora do ar ou Erro no comando SQL !" + ex.getMessage();
        }

    }

    public void criarBanco() {
        try {
            //VOU CONCERTAR ISSO DEPOIS DE VER O DIAGRAMA DO BANCO
            ps = con.prepareStatement("create database if not exists CATALOGOFILMS");
            ps.executeUpdate();
            //VOU CONCERTAR ISSO DEPOIS DE VER O DIAGRAMA DO BANCO
            ps = con.prepareStatement("use CATALOGOFILMS");
            ps.executeUpdate(); // seleciona banco
            //VOU CONCERTAR ISSO DEPOIS DE VER O DIAGRAMA DO BANCO
            sql = "CREATE TABLE IF NOT EXISTS TB_USUARIO ("
                    + "ID_USUARIO int not null AUTO_INCREMENT ,"
                    + "NM_USUARIO varchar(200) not null ,"
                    + "DS_EMAIL varchar(200) not null UNIQUE,"
                    + "DS_SENHA varchar(200) not null ,"
                    + "IMG_FOTO longblob null ,"
                    + "primary key (ID_USUARIO))";
            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL

            sql = "CREATE TABLE IF NOT EXISTS TB_FILME ("
                    + "ID_FILME INT NOT NULL AUTO_INCREMENT,"
                    + "NM_FILME VARCHAR(200) NOT NULL,"
                    + "DS_SINOPSE VARCHAR(200) NULL,"
                    + "HR_DURACAO VARCHAR(200) NULL,"
                    + "DT_LANCAMENTO DATE  NULL,"
                    + "VL_AVALIACAO DECIMAL(2, 1) NULL,"
                    + "NR_CLASSIFICACAO_INDICATIVA INT NULL,"
                    + "primary key (ID_FILME)"
                    + ");";


            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL

            sql = "CREATE TABLE IF NOT EXISTS TB_ATOR ("
                    + "ID_ATOR INT NOT NULL AUTO_INCREMENT,"
                    + "NM_ATOR VARCHAR(200) NOT NULL,"
                    + "NR_IDADE INT NOT NULL,"
                    + "primary key (ID_ATOR)"
                    + ");";

            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL

            sql = "CREATE TABLE IF NOT EXISTS TB_FILME_ATOR ("
                    + "ID_FILME_ATOR INT NOT NULL AUTO_INCREMENT,"
                    + "ID_FILME INT NOT NULL,"
                    + "ID_ATOR INT NOT NULL,"
                    + "primary key (ID_FILME_ATOR),"
                    + "FOREIGN KEY (ID_FILME) REFERENCES TB_FILME(ID_FILME),"
                    + "FOREIGN KEY (ID_ATOR) REFERENCES TB_ATOR(ID_ATOR)"
                    + ");";

            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL

                    sql = "CREATE TABLE IF NOT EXISTS TB_GENERO ("
                    + "ID_GENERO INT NOT NULL AUTO_INCREMENT,"
                    + "NM_GENERO VARCHAR(200) UNIQUE NOT NULL,"
                    + "primary key (ID_GENERO)"
                    + ");";

            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL

            sql = "CREATE TABLE IF NOT EXISTS TB_GENERO_FILME ("
                    + "ID_GENERO_FILME INT NOT NULL AUTO_INCREMENT,"
                    + "ID_FILME INT NOT NULL,"
                    + "ID_GENERO INT NOT NULL,"
                    + "primary key (ID_GENERO_FILME),"
                    + "FOREIGN KEY (ID_FILME) REFERENCES TB_FILME(ID_FILME),"
                    + "FOREIGN KEY (ID_GENERO) REFERENCES TB_GENERO(ID_GENERO)"
                    + ");";

            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL
            
            sql = "CREATE TABLE IF NOT EXISTS TB_COMENTARIO ("
                    + "ID_COMENTARIO INT NOT NULL AUTO_INCREMENT,"
                    + "ID_FILME INT NOT NULL,"
                    + "ID_USUARIO INT NOT NULL,"
                    + "DS_COMENTARIO VARCHAR(400) NOT NULL,"
                    + "DT_COMENTARIO DATE NOT NULL,"
                    + "primary key (ID_COMENTARIO),"
                    + "FOREIGN KEY (ID_FILME) REFERENCES TB_FILME(ID_FILME),"
                    + "FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(ID_USUARIO)"
                    + ");";

            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL
            
            sql = "CREATE TABLE IF NOT EXISTS TB_FAVORITO ("
                    + "ID_FAVORITO INT NOT NULL AUTO_INCREMENT,"
                    + "ID_FILME INT NOT NULL,"
                    + "ID_USUARIO INT NOT NULL,"
                    + "primary key (ID_FAVORITO),"
                    + "FOREIGN KEY (ID_FILME) REFERENCES TB_FILME(ID_FILME),"
                    + "FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(ID_USUARIO)"
                    + ");";

            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL
            
            sql = "INSERT INTO TB_USUARIO (NM_USUARIO, DS_EMAIL, DS_SENHA)SELECT 'admin', 'admin', '1234'WHERE NOT EXISTS (SELECT 1 FROM TB_USUARIO WHERE DS_EMAIL = 'admin');";
            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL
            sql = "INSERT INTO TB_GENERO (NM_GENERO) VALUE('ACAO'),('COMEDIA'),('ROMANCE'),('AVENTURA'),('DESENHO'),('FICCAO');";
            ps = con.prepareStatement(sql); // prepara o objeto que irá executar o comando SQL
            ps.executeUpdate();// Executa o comando SQL


        } catch (SQLException err) {
            htmlError = err.getMessage();
        }
        

        
        
    }
        public void inserirtudo() throws SQLException{
            ps = con.prepareStatement("use CATALOGOFILMS");
            ps.executeUpdate();
            
        }
}

