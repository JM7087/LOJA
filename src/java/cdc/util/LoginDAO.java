/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.Login;

/**
 *
 * @author JM7087-Notbook
 */
public class LoginDAO implements DAO {

    private Connection conn;
    private PreparedStatement ps = null;


    public LoginDAO() throws Exception {
        try {
            this.conn = ConnectionDAO.getConnection();
        } catch (Exception e) {
            throw new Exception("Erro de conexão:" + e.getMessage());
        }
    }

    @Override
    public void atualizar(Object ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void excluir(Object ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List listaTodos() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean login(String email, String senha, HttpSession sessao) throws Exception {

        Connection conn = null;
        ResultSet rs = null;
        List<Usuario> usuarios = new ArrayList<>();

        try {
            conn = this.conn;
            ps = conn.prepareStatement("select * from LOGIN where LOG_EMAIL=? and LOG_SENHA=?");
            ps.setString(1, email);
            ps.setString(2, senha);
            rs = ps.executeQuery();
//            return true;
            if (rs.next()) {
                sessao.setAttribute("statusLogin", 1);
                sessao.setAttribute("LOG_ID", rs.getInt(1));
                return true;
            }
            return false;
        } catch (SQLException sqle) {
            throw new Exception(sqle);
        } finally {
            ConnectionDAO.closeConnection(conn, ps, rs);
        }

    }

    @Override
    public List procura(Object ob) throws Exception {
//        
//        Login login = (Login) ob;
//        PreparedStatement ps = null;
//        Connection conn = null;
//        ResultSet rs = null;
//        List<Cliente> clientes = new ArrayList<>();
//        try{
//            conn = this.conn;
//            ps = conn.prepareStatement("select * from login where log_email=? and log_senha=?");
//            ps.setString(1, login.getLOG_EMAIL());
//            ps.setString(2, login.getLOG_SENHA());
//            rs = ps.executeQuery();
//            
//            while(rs.next()){
//                if (rs.getInt(3) == 0){
//                    
//                }
//                clientes.add(new Cliente(cli_id, cli_nome, cli_telefone, cli_senha, cli_sexo, cli_endereco, cli_cep));
//                }
//        }catch(SQLException sqle){
//            throw new Exception(sqle);
//        }finally{
//           ConnectionDAO.closeConnection(conn, ps, rs);
//           
//       }
        return null;
    }

    @Override
    public void salvar(Object ob) throws Exception {
        Login login;
        login = (Login) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        
        if (login == null) {
            throw new Exception("O valor passado não pode ser nulo");
        }        
        try {
            String SQL = "INSERT INTO LOGIN "
                    + "(log_email, log_senha, usuario_usu_id)"
                    + " VALUES (?,?,?)"; 
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.setString(1, login.getLOG_EMAIL());
            ps.setString(2, login.getLOG_SENHA());
            ps.setInt(3, login.getUSUARIO_USU_ID()); 
            ps.executeUpdate();
          
        } catch (SQLException sqle) {
        throw new Exception("Erro ao inserir dados do usuario: \n"+sqle);

      } finally{
            ConnectionDAO.closeConnection(conn,ps);
        }
    }

//    public void tipoDeUsuario(Object obj) throws Exception {
//        Login login = (Login) obj;
//        
//        if (login == null) {
//            throw new Exception("O valor passado não pode ser nulo");
//        }
//        try {
//            String SQL = "SELECT USU_TIPO FROM login INNER JOIN usuario ON USUARIO_USU_ID = USU_ID WHERE LOG_EMAIL = ?";
//            ps = conn.prepareStatement(SQL);
//            ps.setString(1, login.getLOG_EMAIL());
//
//        } catch (Exception e) {
//        }

//    }
}