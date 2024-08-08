function execucao {
    #Descricao= Condições de execucao.
    addQtdUsada $MyInvocation.InvocationName
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
 
function status {
    #Descricao= Lista com o detalhamento com os status.
    addQtdUsada $MyInvocation.InvocationName
    class Status {
        [string]$cd
        [string]$descricao
    }
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
 
    $lista, '------- CD_TIPO_SITUACAO_NOTA_FISCAL|DS_SITUACAO_NOTA_FISCAL -------', $listaStatus1, '------- CD_STATUS_NFE -------', $listaStatusNfe | format-table -AutoSize
}