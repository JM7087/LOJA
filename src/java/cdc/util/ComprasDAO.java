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
import model.Compras;

/**
 *
 * @author JM7087-Notbook
 */
public class ComprasDAO implements DAO {
    
    private Connection conn;
    private PreparedStatement ps = null;


    public ComprasDAO() throws Exception {
        try {
            this.conn = ConnectionDAO.getConnection();
        } catch (Exception e) {
            throw new Exception("Erro de conexão:" + e.getMessage());
        }
    }


    @Override
    public void atualizar(Object ob) throws Exception {
       


    }

    @Override
    public void excluir(Object ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List listaTodos() throws Exception {
PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try{
            conn = this.conn;
            ps = conn.prepareStatement("SELECT * FROM COMPRAS");
            rs = ps.executeQuery();
            List<Compras> list = new ArrayList<Compras>();
            while(rs.next()){
                   Integer com_id = rs.getInt(1);
                   String com_situacao = rs.getString(2);
                   String com_forma_pagamento = rs.getString(2);
                   Integer usuario_usu_id = rs.getInt(4);
                list.add(new Compras(com_id, com_situacao, com_forma_pagamento, usuario_usu_id));
            }
            return list;
        }catch(SQLException sqle){
            throw new Exception(sqle);
        }finally{
            ConnectionDAO.closeConnection(conn, ps, rs);
        }
    }

    @Override
    public List procura(Object ob) throws Exception {
        List<Compras> list = new ArrayList<Compras>();
          
        Compras compras = (Compras) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        if(compras == null)
            throw new Exception("O valor passado não pode ser nulo");
        try{
            conn = ConnectionDAO.getConnection();
            String SQL = "SELECT * FROM COMPRAS ";
            String where = "";
            boolean checa = false;
            if(compras.getCOM_ID()!=0 || compras.getCOM_SITUACAO()!=null || compras.getCOM_FORMA_PAGAMENTO()!=null || compras.getUSUARIO_USU_ID()!=0){
                where = "WHERE ";
                if(compras.getCOM_ID()!=0){
                    where+= "COM_ID=? ";
                    checa = true;
                }
               
                if(compras.getCOM_SITUACAO()!=null){
                    if(checa) where+="AND";
                    where += " COM_SITUACAO=? ";
                    checa = true;
                }
                if(compras.getCOM_FORMA_PAGAMENTO()!=null){
                    if(checa) where+="AND";
                    where += " COM_FORMA_PAGAMENTO=? ";
                    checa = true;
                }
                if(compras.getUSUARIO_USU_ID()!=0){
                    if(checa) where+="AND";
                    where += " USUARIO_USU_ID=? ";
                    checa = true;
                }
            
            }
            ps = conn.prepareStatement(SQL+where);
            int compraCampos=1;
            if(compras.getCOM_ID()!=0 || compras.getCOM_SITUACAO()!=null || compras.getCOM_FORMA_PAGAMENTO()!=null || compras.getUSUARIO_USU_ID()!=0){
                if (compras.getCOM_ID()!=0){
                    ps.setInt(compraCampos,compras.getCOM_ID());
                    compraCampos++;
                }
                
                if(compras.getCOM_SITUACAO()!=null){
                    if(checa) where+="AND";
                    ps.setString(compraCampos,compras.getCOM_SITUACAO());
                    compraCampos++;
                }
                if(compras.getCOM_FORMA_PAGAMENTO()!=null){
                    ps.setString(compraCampos,compras.getCOM_FORMA_PAGAMENTO());
                    compraCampos++;
                }
                if(compras.getUSUARIO_USU_ID()>=0){
                    ps.setInt(compraCampos,compras.getUSUARIO_USU_ID());
                    compraCampos++;
                }
                
            }

            rs = ps.executeQuery();
            
            while(rs.next()){
                Integer com_id = rs.getInt(1);
                String com_situacao = rs.getString(2);
                String com_forma_pagamento = rs.getString(3);
                Integer usuario_usu_id = rs.getInt(4);
               
                list.add(new Compras(com_id, com_situacao, com_forma_pagamento, usuario_usu_id));
            }

        }catch(SQLException sqle){
        //}catch(Exception e){
            throw new Exception("Erro SQL:" + sqle);
            //throw new Exception();
        }finally{
            ConnectionDAO.closeConnection(conn,ps,rs);
        }
          return list;
        

    }

    @Override
    public void salvar(Object ob) throws Exception {
        Compras compras;
        compras = (Compras) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        
        if (compras == null) {
            throw new Exception("O valor passado não pode ser nulo");
        }
        
        try {
           String SQL = "INSERT INTO `Loja-Online`.`COMPRAS` (`COM_ID`, `COM_SITUACAO`, `COM_FORMA_PAGAMENTO`, `USUARIO_USU_ID`) "
                   + "VALUES (NULL, ?, ?, ?)";
           
           conn = this.conn;
           ps = conn.prepareStatement(SQL);
           ps.setString(1, compras.getCOM_SITUACAO());
           ps.setString(2, compras.getCOM_FORMA_PAGAMENTO());
           ps.setInt(3, compras.getUSUARIO_USU_ID());
           
           
           } catch (SQLException sqle) {
        
        throw new Exception("Erro ao inserir dados do produto: \n"+sqle);

      } finally{
            ConnectionDAO.closeConnection(conn,ps);
        }    
    }
    
}
