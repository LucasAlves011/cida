$CAMINHO_BASE = $PSScriptRoot 

function p {
    write-host $PSScriptRoot   
}

function a {
    #Descricao= Seleciona cd_status,cd_status_nfe da tabela do produto.
    mostrarMensagemPadrao 'SELECT A copiado.' 'select cd_status,cd_status_nfe,a.* from dbamv.nota_fiscal a order by cd_nota_fiscal desc;'
}

function b {
    #Descricao= Seleciona cd_status,cd_status_nfe da tabela do produto - PLANO DE SAUDE.
    mostrarMensagemPadrao 'SELECT b copiado.' 'select cd_status,cd_status_nfe,a.* from dbamv.mvs_nota_fiscal a order by cd_nota_fiscal desc;'
}

function cons {
    #Descricao= Chama integração para CONSULTA.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CONSULTA - CHAMAR INTEGRACAO.txt"
    mostrarMensagemPadrao  'CONSULTA copiado.' $conteudo
}

function env {
    #Descricao= Chama integração para ENVIO.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\ENVIO - CHAMAR INTEGRACAO.txt"
    mostrarMensagemPadrao  'ENVIO copiado.' $conteudo
}

function can {
    #Descricao= Chama integração para CANCELAMENTO.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CANCELAMENTO - CHAMAR INTEGRACAO.txt"
    mostrarMensagemPadrao  'CANCELAMENTO copiado.' $conteudo
}

function contar {
    #Descricao= Conta quantas notas estão em status A nas tabelas MVINTEGRA.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CONTAR AGUARDANDO.txt"
    mostrarMensagemPadrao  'CONTAR copiado.' $conteudo
}

function erro {
    #Descricao= Seta notas para erro na tabela do produto.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\SETAR ERRO.txt"
    mostrarMensagemPadrao  'ERRO copiado.' $conteudo
}

function monta {
    #Descricao= Monta TRIGGERS e PROCEDURES.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\Script Monta Trigger e procedure.txt"
    mostrarMensagemPadrao  'MONTA copiado.' $conteudo
}

function drop {
    #Descricao= Dropa pontos de integração.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\DROP_PONTOS_INTEGRA_NFSE.txt"
    mostrarMensagemPadrao  'DROP copiado.' $conteudo
}

function monitora {
    #Descricao= Cria tabela e triggers para monitora tomcats.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CRIA TABELA E TRIGGER PARA MONITORAR OS TOMCATS.txt"
    mostrarMensagemPadrao 'MONITORA copiado.' $conteudo
}

function condicoes {
    #Descricao= Chama integração para consulta.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\preenche_condicoes_envio_all_v5.txt"
    mostrarMensagemPadrao 'CONDICOES copiado.' $conteudo
}

function verificaxml {
    #Descricao= Verifica XML padrão.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\VERIFICAR XML PADRAO.txt"
    mostrarMensagemPadrao  'VERIFICA XML copiado.' $conteudo
}

function merged {
    #Descricao= Merged script.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\merged-nfse-scripts.txt"
    mostrarMensagemPadrao 'MERGED copiado.'  $conteudo
}

function espaco {
    #Descricao= Procura por espacos vazios no cadastro de sa�da.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\PROCURAR ESPACOS CADASTRO SAIDA.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'VERIFICAR ESPACO copiado.' $conteudo
}

function cloud {
    #Descricao= Link do repositorio na cloud para import.
    mostrarMensagemPadrao 'LINK CLOUD copiado.' 'https://cloud.mv.com.br/index.php/s/7WRnvOtf2VrRac4'
}

function tributo {
    #Descricao= Select nos tributos da nota.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\cTRIBUTO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'TRIBUTO copiado.' $conteudo
}

function saida {
    #Descricao= Parametros cadastro de saida.
    mostrarMensagemPadrao  'SELECT SAIDA copiado.' "SELECT b.CD_SISTEMA_DESTINO,b.ds_saida,a.* FROM mvintegra.imv_configuracao_saida_param a 
    INNER JOIN mvintegra.imv_configuracao_saida b ON a.cd_imv_configuracao_saida = b.cd_imv_configuracao_saida 
    WHERE (b.ds_saida like ('%RPS%') OR b.ds_saida LIKE ('%NFSE%'))"
}

class Funcao {
    [string]$Nome
    [string]$Descricao
}
class Status {
    [string]$cd
    [string]$descricao
}

function execucao {
    #Descricao= Condições de execucao.
    class CondicaoEnvio {
        [string]$empresa
        [string]$coluna
        [string]$condicao
        [string]$valor
    }

    $envio = @(
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_STATUS'; condicao = 'Igual a' ; valor = 'E' },
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_STATUS_NFE'; condicao = 'Igual a' ; valor = 'A' },
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_MULTI_EMPRESA'; condicao = 'Igual a' ; valor = '1' }
    )

    $consulta = @(
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_STATUS_NFE'; condicao = 'Igual a' ; valor = 'T' },
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_MULTI_EMPRESA'; condicao = 'Igual a' ; valor = '1' }
    )

    $cancelamento = @(
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_STATUS_NFE'; condicao = 'Igual a' ; valor = 'C' },
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_MULTI_EMPRESA'; condicao = 'Igual a' ; valor = '1' }
        [CondicaoEnvio]@{empresa = '1'  ; coluna = 'CD_TIPO_SITUACAO_NOTA_FISCAL'; condicao = 'Igual a' ; valor = '11' }
    )
    $envio , '--------------------- Consulta ---------------------' , $consulta, '------------------- Cancelamento -------------------', $cancelamento | Format-Table -AutoSize
}

function func {
    #Descricao= Catálogo de funções no powerShell.
    $listaFuncoes = @()
    $caminhoArquivo = "$CAMINHO_BASE\Microsoft.PowerShell_profile.ps1"

    $conteudo = Get-Content -Path $caminhoArquivo -Raw -Encoding UTF8

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
             #   $nome = $palavrasSubsequentes[0]
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

function status {
    #Descricao= Lista com o detalhamento com os status.
    $listaStatus1 = @(
        [Status]@{cd = '1'  ; descricao = 'RPS Gravado' },
        [Status]@{cd = '2'  ; descricao = 'RPS Impresso' },
        [Status]@{cd = '3'  ; descricao = 'RPS Cancelado' },
        [Status]@{cd = '4'  ; descricao = 'Solicitada convers�o de RPS para NFe' },
        [Status]@{cd = '6'  ; descricao = 'Protocolo de convers�o de RPS em NFe recebido' },
        [Status]@{cd = '7'  ; descricao = 'Consultando Protocolo de convers�o de RPS em NFe' },
        [Status]@{cd = '8'  ; descricao = 'Falha ao consultar Protocolo de convers�o de RPS em NFe' },
        [Status]@{cd = '9'  ; descricao = 'NFe Gerada com sucesso' },
        [Status]@{cd = '10' ; descricao = 'Falha ao gerar NFe' },
        [Status]@{cd = '11' ; descricao = 'Solicitado Cancelamento da NFe' },
        [Status]@{cd = '12' ; descricao = 'NFe Cancelada' },
        [Status]@{cd = '13' ; descricao = 'Falha no Cancelamento de NFe' },
        [Status]@{cd = '24' ; descricao = 'RPS na fila de conversão(aguardando RPS anterior ser processada)' }
    )

    <#
        #TODO: implementar isso depois
             Não implementados ainda (NÃO SEI SE DE FATO NÃO FOI IMPLEMENTADO)
                      ----------------------------------------------------------

                       5|RPS em processo de conversão para NFe
                      14|Solicitando inutilização de numeração de nota
                      15|Falha ao processar inutilização de numeração de nota
                      16|NFe substituída
                      17|Falha ao processar substituição de NFe
                      18|Substituição de NFe realizada com sucesso
                      19|Solicitando envio de carta de correção
                      20|Falha ao processar envio de carta de correção
                      21|Carta de correção enviada com sucesso
    #>

    $listaStatusNfe = @(
        [Status]@{cd = 'X' ; descricao = 'Inicial' },
        [Status]@{cd = 'A' ; descricao = 'Aguardando Integra��o (envio)' },
        [Status]@{cd = 'C' ; descricao = 'Solicita cancelamento de NFe' },
        [Status]@{cd = 'W' ; descricao = 'Ignorar Mudan�a de estado' },
        [Status]@{cd = 'I' ; descricao = 'Protocolo Recebido' },
        [Status]@{cd = 'T' ; descricao = 'Consulta Protocolo' },
        [Status]@{cd = 'R' ; descricao = 'Respondido com cr�tica' },
        [Status]@{cd = 'P' ; descricao = 'Processado com Sucesso' }
    )

    $lista = @([Status]@{cd = ' ' ; descricao = ' ' })

    # Write-host  -NoNewline
    $lista, '------- CD_TIPO_SITUACAO_NOTA_FISCAL|DS_SITUACAO_NOTA_FISCAL -------' , $listaStatus1, '------- CD_STATUS_NFE -------', $listaStatusNfe | format-table -AutoSize
}

function c {
    #Descricao= Utilitario de pastas
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
    param (
        [string]$mensagem,
        [string]$conteudo        
    )

    if ($conteudo -ne $null) {
        Set-Clipboard -value $conteudo
    }

    if ($mensagem -ne $null) {
        printCentralizado $mensagem 'Green'
    }    

    write-host "
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
    Start-Sleep -Milliseconds 500
    #Exit
}

function printCentralizado {
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