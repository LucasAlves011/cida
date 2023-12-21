function c {
    #Descricao= Utilitario de pastas.
    param(
        [string]$inputNamePasta
    )
    $previneLoop = 0
    $caminho = 'C:\Users\lucas.matheus\Desktop\Clientes'

    do {
        $pastasEncontradas = Get-ChildItem -Path $caminho -Directory | Where-Object { $_.Name.ToUpper() -like "*$inputNamePasta*".ToUpper() }

        if ($inputNamePasta -ne "") {
            if ($pastasEncontradas.Count -eq 0) {
                #Criar nova pasta
                Write-Host "Nova pasta criada... " $inputNamePasta -ForegroundColor Green
                New-Item -ItemType Directory -Path "$caminho\$inputNamePasta" -Force
                Start-Process explorer.exe -ArgumentList "$caminho\$inputNamePasta"
                mostrarMensagemPadrao $null $null
            }
            elseif ($pastasEncontradas.Count -eq 1) {
                #abre a pasta
                Start-Process explorer.exe -ArgumentList "$caminho\$pastasEncontradas"
                Exit
            }
            else {
                #Várias pastas foram encontradas
                $pastasEncontradas | Format-Table -AutoSize
                $inputNamePasta = Read-Host  "Varias pastas foram encontradas, seja mais especifico. Digite o nome de uma pasta "
            }
        }
        else {
            #abrir a pasta clientes
            Start-Process explorer.exe -ArgumentList 'C:\Users\lucas.matheus\Desktop\Clientes\'
            Exit
        }
        $previneLoop++;
    }while ( $previneLoop -lt 5 )
    Exit
}

function mostrarMensagemPadrao {
    #Descricao=
    param (
        [string]$mensagem,
        [string]$conteudo,
        [int]$tempoFechamento = 500,
        [bool]$fechaAutomatico = $true,
        [string]$corTexto = 'Green'        
    )
    write-host  "
    ::::::::::::::::::   :
  ^J555555555555555555: :P5?~:
  ?P555555555555555555: :GGGGPY?~:
  :755555555?!!777777!   YGGGGGGGPY?~:
    :7Y55555Y7:           :!J5GGGGGGGPY7~:
      :7Y5555557:             ^7YPGGGGGGGPY7^
         !Y555555?                ^7YGGGGGGGG7
         ^J555555Y:               ^7YGGGGGGGG7
       ~J555555J~             :!JPGGGGGGGPY7^
     ~J555555?^            ^7YGGGGGGGG5?~:
   ~J5555555?~~~~~~~~~   JPGGGGGGG5J!:
  75555555555555555555:  PGGGGPJ!^
  ~Y555555555555555555:  PPY7^
   :^~~~~~~~~~~~~~~~~~   ^
"

    if ($conteudo -ne $null) {
        Set-Clipboard -value $conteudo
    }

    if ($mensagem -ne $null) {
        printCentralizado $mensagem $corTexto
    }
  
    Start-Sleep -Milliseconds $tempoFechamento
    
    if ($fechaAutomatico){
        Exit
    }
}

function printCentralizado {
    #Descricao=
    param (
        [string]$Texto,
        [string]$Cor
    )
    $larguraDaJanela = $Host.UI.RawUI.WindowSize.Width
    $espacosAntes = ($larguraDaJanela - $Texto.Length) / 2
    $espacosDepois = $larguraDaJanela - $Texto.Length - $espacosAntes
    $textoCentralizado = (" " * $espacosAntes) + $Texto + (" " * $espacosDepois)
    Write-Host $textoCentralizado -ForegroundColor $Cor
}

function func {
    #Descricao= Catálogo de funções no powerShell.
    $listaFuncoes = @()
    $arquivosPS1  = Get-ChildItem -Path $CAMINHO_BASE -Filter *.ps1

    foreach ($arquivo in $arquivosPS1) {
        $conteudo +=  Get-Content -Path $arquivo.FullName -Raw -Encoding UTF8
    }

    $indicesFunction = @()
    $indice = $conteudo.IndexOf("function")

    while ($indice -ne -1) {
        $indicesFunction += $indice
        $indice = $conteudo.IndexOf("function", $indice + 1)
    }
    foreach ($indiceFunction in $indicesFunction) {
        try {
            $substring = $conteudo.Substring($indiceFunction)

            $palavrasSubsequentes = $substring -split '\s+' | Select-Object -Skip 1
            if ( $palavrasSubsequentes[1] -eq '{') {
                $substring = $substring -split "`r`n"
                $descricao = $substring | Where-Object { $_ -match '#Descricao=' } | Select-Object -First 1 | ForEach-Object { $_ -replace '#Descricao=' }
            }

            if (($listaFuncoes | Where-Object { $_.Descricao -eq $descricao.Trim() }).Count -eq 0 ) {
                $listaFuncoes += [Funcao]@{Nome = $palavrasSubsequentes[0]; Descricao = $descricao.Trim() }
            }
        }
        catch {

        }
    }
    $listaFuncoes | Format-Table -AutoSize

    do {
        $escolhaFuncao = Read-Host "Qual funcao deseja escolher "
        #Split para dar suporte a funçõe com argumentos, ele vai procurar pelo nome da função que vem antes do ' '.
        if ($listaFuncoes.Nome -contains $escolhaFuncao.Split(' ')[0]) {
            Invoke-Expression "$escolhaFuncao"
        }
        elseif ($escolhaFuncao -eq "") {
            mostrarMensagemPadrao 'Saindo...' $null
        }
        else {
            Write-Host $escolhaFuncao "nao e uma funcao valida. Tente novamente"  -ForegroundColor Red
        }
    } while ($listaFuncoes.Nome -notcontains $escolhaFuncao)

}