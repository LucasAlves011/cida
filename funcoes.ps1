class Configuracao {
    [int]$tempoFechamento
    [string]$corTexto
}

class Funcao {
    [string]$nome
    [string]$descricao
    [string]$conteudo
    [int]$count
    [Configuracao]$configuracao

    Funcao([int]$tempoFechamento , [string]$corTexto) {
        $this.configuracao = [Configuracao]::new($tempoFechamento, $corTexto)
    }
}




function envio2 {
    #Descricao: asd
    mostrarMensagemPadrao 'asdasdasd'
}

