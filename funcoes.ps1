
function gui { 
    #Descricao= Senha do gui.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\gui.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao "gui copiado." $conteudo
}

