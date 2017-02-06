/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author JM7087-Notbook
 */
public class Compras {
    private int COM_ID; 
    private String COM_SITUACAO;
    private String COM_FORMA_PAGAMENTO;
    private int USUARIO_USU_ID;

    public Compras(int COM_ID, String COM_SITUACAO, String COM_FORMA_PAGAMENTO, int USUARIO_USU_ID) {
        this.COM_ID = COM_ID;
        this.COM_SITUACAO = COM_SITUACAO;
        this.COM_FORMA_PAGAMENTO = COM_FORMA_PAGAMENTO;
        this.USUARIO_USU_ID = USUARIO_USU_ID;
    }

    public int getCOM_ID() {
        return COM_ID;
    }

    public void setCOM_ID(int COM_ID) {
        this.COM_ID = COM_ID;
    }

    public String getCOM_SITUACAO() {
        return COM_SITUACAO;
    }

    public void setCOM_SITUACAO(String COM_SITUACAO) {
        this.COM_SITUACAO = COM_SITUACAO;
    }

    public String getCOM_FORMA_PAGAMENTO() {
        return COM_FORMA_PAGAMENTO;
    }

    public void setCOM_FORMA_PAGAMENTO(String COM_FORMA_PAGAMENTO) {
        this.COM_FORMA_PAGAMENTO = COM_FORMA_PAGAMENTO;
    }

    public int getUSUARIO_USU_ID() {
        return USUARIO_USU_ID;
    }

    public void setUSUARIO_USU_ID(int USUARIO_USU_ID) {
        this.USUARIO_USU_ID = USUARIO_USU_ID;
    }

   
}
