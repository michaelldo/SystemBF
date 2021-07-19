
package beans;

import java.util.Objects;

public class ProdutoPedido {
 private Pedido pedido;
 private Produto produto;
 private int quantidade;
 private int qtdBola;

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProdutoPedido other = (ProdutoPedido) obj;
        if (this.produto.getIdProduto()!= other.getProduto().getIdProduto() || this.qtdBola != other.getQtdBola() ) {
            return false;
        }
        return true;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getQtdBola() {
        return qtdBola;
    }

    public void setQtdBola(int qtdBola) {
        this.qtdBola = qtdBola;
    }
 
}
