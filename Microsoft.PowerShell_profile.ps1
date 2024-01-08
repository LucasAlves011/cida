."$PSScriptRoot/utilitarios.ps1" #Import de utilitarios

$CAMINHO_BASE = $PSScriptRoot #Caminho da pasta onde este script roda

class Funcao {
    [string]$Nome
    [string]$Descricao
}
class Status {
    [string]$cd
    [string]$descricao
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
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CONSULTA - CHAMAR INTEGRACAO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'CONSULTA copiado.' $conteudo
}

function env {
    #Descricao= Chama integração para ENVIO.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\ENVIO - CHAMAR INTEGRACAO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'ENVIO copiado.' $conteudo
}

function can {
    #Descricao= Chama integração para CANCELAMENTO.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CANCELAMENTO - CHAMAR INTEGRACAO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'CANCELAMENTO copiado.' $conteudo
}

function contar {
    #Descricao= Conta quantas notas estão em status A nas tabelas MVINTEGRA.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CONTAR AGUARDANDO.sql" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'CONTAR copiado.' $conteudo
}

function erro {
    #Descricao= Seta notas para erro na tabela do produto.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\SETAR ERRO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'ERRO copiado.' $conteudo
}

function monta {
    #Descricao= Monta TRIGGERS e PROCEDURES.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\Script Monta Trigger e procedure.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'MONTA copiado.' $conteudo
}

function drop {
    #Descricao= Dropa pontos de integração.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\DROP_PONTOS_INTEGRA_NFSE.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'DROP copiado.' $conteudo
}

function monitora {
    #Descricao= Cria tabela e triggers para monitora tomcats.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CRIA TABELA E TRIGGER PARA MONITORAR OS TOMCATS.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'MONITORA copiado.' $conteudo
}

function condicoes {
    #Descricao= Chama integração para consulta.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\preenche_condicoes_envio_all_v5.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'CONDICOES copiado.' $conteudo
}

function verificaxml {
    #Descricao= Verifica XML padrão.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\VERIFICAR XML PADRAO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao  'VERIFICA XML copiado.' $conteudo
}

function merged {
    #Descricao= Merged script.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\merged-nfse-scripts.txt" -Raw -Encoding UTF8
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

function excluirxmlp {
    #Descricao= Excluir xml padrão.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\EXCLUIR XML PADRAO.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'EXCLUIR XML PADRAO copiado.' $conteudo
}

function saida {
    #Descricao= Parametros cadastro de saida.
    mostrarMensagemPadrao  'SELECT SAIDA copiado.' "SELECT b.cd_empresa_destino,b.CD_SISTEMA_DESTINO,b.ds_saida,a.* FROM mvintegra.imv_configuracao_saida_param a 
    INNER JOIN mvintegra.imv_configuracao_saida b ON a.cd_imv_configuracao_saida = b.cd_imv_configuracao_saida 
    WHERE (b.ds_saida like ('%RPS%') OR b.ds_saida LIKE ('%NFSE%'))"
}

function url {
    #Descricao= Select da tabela sistemas, util para achar a url do soul.
    mostrarMensagemPadrao 'Procurar a url no sistema APOIO, não use o PEP' 'select * from dbasgu.produto_sistema' -tempoFechamento 1000 -corTexto 'Red'
}

function cdenvio {
    #Descricao= Select da condicoes de envio.
	$conteudo =  Get-Content -path "$CAMINHO_BASE/scripts\SELECT CONDICOES DE ENVIO.txt" -Raw -Encoding UTF8 
    mostrarMensagemPadrao 'SELECT CONDICOES ENVIO copiado' $conteudo -tempoFechamento 1000 -corTexto 'Green'
}

function user {
    #Descricao= Seleciona usuarios.
    mostrarMensagemPadrao 'SELECT USUARIOS copiado.' 'SELECT * FROM dbasgu.usuarios;'
}

function jconsole {
    #Descricao= Seleciona usuarios.
    mostrarMensagemPadrao 'SELECT JCONSOLE copiado.' '-Dcom.sun.management.jmxremote
    -Dcom.sun.management.jmxremote.port=7143
    -Dcom.sun.management.jmxremote.ssl=false
    -Dcom.sun.management.jmxremote.authenticate=false' -corTexto 'Blue'
}

function questionario {
    #Descricao= Seleciona questionario de NFSE.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\QUESTIONARIO_NFSE.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'QUESTIONARIO NFSE copiado.' $conteudo
}

function senha {
    #Descricao= Seleciona senha do gerador de senha.
    mostrarMensagemPadrao 'SENHA copiada.' '*gcpgp!04'
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

    $lista, '------- CD_TIPO_SITUACAO_NOTA_FISCAL|DS_SITUACAO_NOTA_FISCAL -------', $listaStatus1, '------- CD_STATUS_NFE -------', $listaStatusNfe | format-table -AutoSize
}
