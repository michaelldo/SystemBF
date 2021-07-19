<script>
    if(document.getElementById('quantidade').value >= 5){
        alert('A quantidade selecionada não é válida!.');
    }
</script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<div style="margin: 0 auto; width: 300px;padding: 10px; background-color: #DCDCDC; margin-top: 10%;border-radius: 10px">
    <form action="AdicionarProduto" method="post">
        <h2 style="text-align: center;"><b>PRODUTO</b><br/>
            ${produto.categoriaId.nome}
            ${produto.categoriaId.tipo}
            ${produto.saborId.descricao}
        </h2>
        <input type="hidden" name="idProduto" value="${produto.idProduto}">
        <div class="form-group">
            <label for="quantidade">Quantidade:</label>
            <input required id="quantidade" class="form-control" type="number" step="1" min="0" name="quantidade">
        </div>
        <div class="form-group">
            <label for="qtdBola">Quantidade de Bola:</label>
            <input id="qtdBola" class="form-control" type="number" step="1" min="0" name="qtdBola">
        </div>
        <div class="form-group">
            <button class="btn btn-success">ADICIONAR</button>
            <a class="btn btn-warning"href="PDV.jsp">VOLTAR</a>
        </div>
    </form>
</div>
