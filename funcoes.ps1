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

    function Funcao([int]$tempoFechamento) {
        $this.configuracao.$tempoFechamento = $tempoFechamento        
    }
}

function c {
    $jsonContent = Get-Content -Path "C:\Users\lucas.matheus\Documents\Projetos GIT\mavi\teste.json" -Raw
    $jsonList= $jsonContent | ConvertFrom-Json
    write-host $jsonObject.nome

    $teste = 

    foreach ($item in $jsonList){
        Write-Output $item
    }
   
   ##Write-Host ($lista | Sort-Object)  
}
