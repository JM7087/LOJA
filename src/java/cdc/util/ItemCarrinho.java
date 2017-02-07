/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc.util;

import model.Produto;

/**
 *
 * @author JM7087-Notbook
 */
public class ItemCarrinho {
    private final Produto produto;
    
    public ItemCarrinho(Produto prod){
        this.produto = prod;
    }
    
    public Produto getProduto(){
        return this.produto;
    }
    
}
