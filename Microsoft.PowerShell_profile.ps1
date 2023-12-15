function a {
    #Descricao= Seleciona cd_status,cd_status_nfe da tabela do produto.
    set-clipboard -value 'select cd_status,cd_status_nfe,a.* from dbamv.nota_fiscal a order by cd_nota_fiscal desc;'    
    Write-Host  'SELECT a copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit
}

function b { 
    #Descricao= Seleciona cd_status,cd_status_nfe da tabela do produto - PLANO DE SAUDE.
    set-clipboard -value 'select cd_status,cd_status_nfe,a.* from dbamv.mvs_nota_fiscal a order by cd_nota_fiscal desc;' 
    Write-Host  'SELECT b copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit 
}

function cons {
    #Descricao= Chama integração para CONSULTA.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\CONSULTA - CHAMAR INTEGRACAO.txt" 
    Set-Clipboard -value $conteudo
    Write-Host  'CONSULTA copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit 
}

function env { 
    #Descricao= Chama integração para ENVIO.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\ENVIO - CHAMAR INTEGRACAO.txt"
    Set-Clipboard -value $conteudo
    Write-Host  'ENVIO copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit 
}

function can { 
    #Descricao= Chama integração para CANCELAMENTO.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\CANCELAMENTO - CHAMAR INTEGRACAO.txt"
    Set-Clipboard -value $conteudo
    Write-Host  'CANCELAMENTO copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit       
}

function contar {
    #Descricao= Conta quantas notas estão em status A nas tabelas MVINTEGRA.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\CONTAR AGUARDANDO.txt"
    Set-Clipboard -value $conteudo
    Write-Host  'CONTAR copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit 
}

function erro { 
    #Descricao= Seta notas para erro na tabela do produto.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\SETAR ERRO.txt"
    Set-Clipboard -value $conteudo
    Write-Host  'ERRO copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit  
}

function monta { 
    #Descricao= Monta TRIGGERS e PROCEDURES.
    $conteudo = Get-Content -path "C:\Users\lucas.matheus\Desktop\principais_scripts\Script Monta Trigger e procedure.SQL"
    Set-Clipboard -value $conteudo
    Write-Host  'MONTA copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit 
}

function drop {
    #Descricao= Dropa pontos de integração.
    $conteudo = Get-Content -path "C:\Users\lucas.matheus\Desktop\principais_scripts\DROP_PONTOS_INTEGRA_NFSE.SQL"
    Set-Clipboard -value $conteudo
    Write-Host  'DROP copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit 
}

function monitora { 
    #Descricao= Cria tabela e triggers para monitora tomcats.
    $conteudo = Get-Content -path "C:\Users\lucas.matheus\Desktop\principais_scripts\CRIA TABELA E TRIGGER PARA MONITORAR OS TOMCATS.sql"
    Set-Clipboard -value $conteudo
    Write-Host  'MONITORA copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit 
} 

function condicoes {
    #Descricao= Chama integração para consulta.
    $conteudo = Get-Content -path "C:\Users\lucas.matheus\Desktop\principais_scripts\preenche_condicoes_envio_all_v5.sql"
    Set-Clipboard -value $conteudo
    Write-Host  'CONDICOES copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit  
}

function verificaxml { 
    #Descricao= Verifica XML padrão.
    $conteudo = Get-Content -path "C:\Users\lucas.matheus\Desktop\principais_scripts\VERIFICAR XML PADRAO.SQL"
    Set-Clipboard -value $conteudo
    Write-Host  'VERIFICA XML copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit  
} 


function merged { 
    #Descricao= Merged script.
    $conteudo = Get-Content -path "C:\Users\diogo.pimentel\Documents\Util MV\Script\merged-nfse-scripts.sql"
    Set-Clipboard -value $conteudo
    Write-Host  'MERGED copiado.' -ForegroundColor Green
    Start-Sleep -Milliseconds 400
    Exit  
}

function espaco {
    #Descricao= Procura por espacos vazios no cadastro de sa�da.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\PROCURAR ESPACOS CADASTRO SAIDA.txt" -Raw -Encoding UTF8
    Set-Clipboard -value $conteudo
    Write-Host  'VERIFICAR ESPACO copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit  
}

function cloud {
    #Descricao= Link do repositorio na cloud para import.
    Set-Clipboard -value 'https://cloud.mv.com.br/index.php/s/7WRnvOtf2VrRac4'
    Write-Host  'LINK CLOUD copiado.' -ForegroundColor Green 
    Start-Sleep -Milliseconds 400
    Exit 
}
function tributo {
    #Descricao= Select nos tributos da nota.
    $conteudo = Get-Content -path "S:\SERVICOS -TECNICOS\INTEGRACAO_CONSULTORIA\NFSE\cTRIBUTO.txt" -Raw -Encoding UTF8
    Set-Clipboard -value $conteudo
    Write-Host  'TRIBUTO copiado.' -ForegroundColor Green    
    Start-Sleep -Milliseconds 400
    Exit      
}


class Funcao {
    [string]$Nome
    [string]$Descricao    
}
class Status {
    [string]$cd
    [string]$descricao
}

function condicoes {
    #Descricao= Condições de envio.  
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
    $caminhoArquivo = "C:\Users\lucas.matheus\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" 
    
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
                $nome = $palavrasSubsequentes[0]
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
            Write-host 'Saindo...'
            Start-Sleep -Milliseconds 400
            Exit  
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
                Start-Sleep -Milliseconds 400
                Exit            
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