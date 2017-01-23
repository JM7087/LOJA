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
import model.Produto;

/**
 *
 * @author JM7087-Notbook
 */
public class ProdutoDAO implements DAO{
    
     private Connection conn;
    private PreparedStatement ps = null;


    public ProdutoDAO() throws Exception {
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

    @Override
    public List procura(Object ob) throws Exception {
         List<Produto> list = new ArrayList<Produto>();
          
        Produto produto = (Produto) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        if(produto == null)
            throw new Exception("O valor passado não pode ser nulo");
        try{
            conn = ConnectionDAO.getConnection();
            String SQL = "SELECT * FROM PRODUTO ";
            String where = "";
            boolean checa = false;
            if(produto.getPRO_ID()!=0 || produto.getPRO_NOME()!=null || produto.getPRO_DESCRICAO()!=null || produto.getPRO_VALOR()!=0 || produto.getPRO_QUANTIDADE()!=0 || produto.getPRO_MARCA()!=null || produto.getPRO_CATEGORIA()!=null){
                where = "WHERE ";
                if(produto.getPRO_ID()!=0){
                    where+= "PRO_ID=? ";
                    checa = true;
                }
                if(produto.getPRO_NOME()!=null){
                    if(checa) where+="AND";
                    where += " PRO_NOME=? ";
                    checa = true;
                }
            }
            ps = conn.prepareStatement(SQL+where);
            int contaCampos=1;
            if(produto.getPRO_ID()!=0 || produto.getPRO_NOME()!=null || produto.getPRO_DESCRICAO()!=null || produto.getPRO_VALOR()!=0 || produto.getPRO_QUANTIDADE()!=0 || produto.getPRO_MARCA()!=null || produto.getPRO_CATEGORIA()!=null){
                if (produto.getPRO_ID()!=0){
                    ps.setInt(contaCampos,produto.getPRO_ID());
                    contaCampos++;
                }
                if (produto.getPRO_NOME()!=null){
                    ps.setString(contaCampos,produto.getPRO_NOME());
                    contaCampos++;
                }
            }

            rs = ps.executeQuery();
            
            while(rs.next()){
                Integer pro_id = rs.getInt(1);
                String pro_nome = rs.getString(2);
                String pro_descricao = rs.getString(3);
                double pro_valor = rs.getDouble(4);
                Integer pro_quatidade = rs.getInt(5);
               // byte[] pro_fotos = rs.getBytes(6);
                String pro_marca = rs.getString(6);
                String pro_categoria = rs.getString(7);
                list.add(new Produto(pro_id, pro_nome, pro_descricao, pro_valor, pro_quatidade, pro_marca, pro_categoria));
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
        
        Produto produto;
        produto = (Produto) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        
        if (produto == null) {
            throw new Exception("O valor passado não pode ser nulo");
        }
                
        try {
           String SQL = "INSERT INTO `Loja-Online`.`PRODUTO` (`PRO_ID`, `PRO_NOME`, `PRO_DESCRICAO`, `PRO_VALOR`, `PRO_QUANTIDADE`, `PRO_FOTOS` "
                   + "`PRO_MARCA`, `PRO_CATEGORIA`) VALUES (NULL, ?, ?, ?, ?, NULL, ?, ?)";
           
           conn = this.conn;
           ps = conn.prepareStatement(SQL);
           ps.setString(1, produto.getPRO_NOME());
           ps.setString(2, produto.getPRO_DESCRICAO());
           ps.setDouble(3, produto.getPRO_VALOR());
           ps.setInt(4, produto.getPRO_QUANTIDADE());
          // ps.setBytes(5, produto.getPRO_FOTOS());
           ps.setString(5, produto.getPRO_MARCA());
           ps.setString(5, produto.getPRO_CATEGORIA());
           
        } catch (SQLException sqle) {
        
        throw new Exception("Erro ao inserir dados do produto: \n"+sqle);

      } finally{
            ConnectionDAO.closeConnection(conn,ps);
        }

    }
    
}