
function a { 
    #Descricao= Seleciona cd_status,cd_status_nfe da tabela do produto.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\a.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "a copiado." $conteudo
}

 
function b { 
    #Descricao= Seleciona cd_status,cd_status_nfe da tabela do produto - PLANO DE SAUDE.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\b.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "b copiado." $conteudo
}

 
function cons {
    #Descricao= Chama integração para CONSULTA.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\cons.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'CONSULTA copiado.' $conteudo
}
 
function env {
    #Descricao= Chama integração para ENVIO.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\env.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'ENVIO copiado.' $conteudo
}
 
function can {
    #Descricao= Chama integração para CANCELAMENTO.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\can.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'CANCELAMENTO copiado.' $conteudo
}
 
function contar {
    #Descricao= Conta quantas notas estão em status A nas tabelas MVINTEGRA.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\contar.sql" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'CONTAR copiado.' $conteudo
}
 
function erro {
    #Descricao= Seta notas para erro na tabela do produto.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\erro.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'ERRO copiado.' $conteudo
}
 
function monta {
    #Descricao= Monta TRIGGERS e PROCEDURES.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\monta.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'MONTA copiado.' $conteudo
}
 
function envmassa {
    #Descricao= Chama a integração de envio em massa.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\envmassa.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'Envio em massa copiado.' $conteudo
}
 
function consmassa {
    #Descricao= Chama a integração de consulta em massa.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\consmassa.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'Consulta em massa copiado.' $conteudo
}
 
function copia {
    #Descricao= Copia parametros de uma saida.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\copia.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'Copia copiado.' $conteudo
}
 
 
function drop {
    #Descricao= Dropa pontos de integração.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\drop.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'DROP copiado.' $conteudo
}
 
function monitora {
    #Descricao= Cria tabela e triggers para monitora tomcats.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\monitora.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'MONITORA copiado.' $conteudo
}
 
function condicoes {
    #Descricao= Chama integração para consulta.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\condicoes.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'CONDICOES copiado.' $conteudo
}
 
function verificaxml {
    #Descricao= Verifica XML padrão.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\verificaxml.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao  'VERIFICA XML copiado.' $conteudo
}
 
function merged {
    #Descricao= Merged script.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\merged.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'MERGED copiado.'  $conteudo
}
 
function espaco {
    #Descricao= Procura por espacos vazios no cadastro de sa�da.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\espaco.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'VERIFICAR ESPACO copiado.' $conteudo
}
 
function cloud {
    #Descricao= Link do repositorio na cloud para import.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\cloud.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'LINK CLOUD copiado.' $conteudo
}
 
function tributo {
    #Descricao= Select nos tributos da nota.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\tributo.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'TRIBUTO copiado.' $conteudo
}
 
function excluirxmlp {
    #Descricao= Excluir xml padrão.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\excluirxmlp.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'EXCLUIR XML PADRAO copiado.' $conteudo
}
 
function saida { 
    #Descricao= Parametros cadastro de saida.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\saida.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "saida copiado." $conteudo
}

 
function url {
    #Descricao= Select da tabela sistemas, util para achar a url do soul.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\url.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'Procurar a url no sistema APOIO, nao use o PEP' -conteudo $conteudo -corTexto 'Red'
}
 
function cdenvio {
    #Descricao= Select da condicoes de envio.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\cdenvio.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'SELECT CONDICOES ENVIO copiado' $conteudo -tempoFechamento 1000 -corTexto 'Green'
}
 
function user {
    #Descricao= Seleciona usuarios.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\user.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'SELECT USUARIOS copiado.' $conteudo
}
 
function jconsole {
    #Descricao= Seleciona usuarios.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\jconsole.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'SELECT JCONSOLE copiado.' $conteudo -corTexto 'Blue'
}
 
function questionario {
    #Descricao= Seleciona questionario de NFSE.
    addQtdUsada $MyInvocation.InvocationName
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\questionario.txt" -Raw -Encoding UTF8
    mostrarMensagemPadrao 'QUESTIONARIO NFSE copiado.' $conteudo
}
 
function senha {
    #Descricao= Seleciona senha do gerador de senha.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\senha.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao 'SENHA copiada.' $conteudo
}
<#
 function codemavi {
    #Descricao= Abre o projeto mavi no VS Code.
    mostrarMensagemPadrao 'Abrindo MAVI VS Code' '' -tempoFechamento 0
    write-host $CAMINHO_BASE
    Start-Process "C:\Users\lucas.matheus\AppData\Local\Programs\Microsoft VS Code\Code.exe" $CAMINHO_BASE
 }
 #>


function gui { 
    #Descricao= Senha do gui.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\gui.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "gui copiado." $conteudo
}

function tls { 
    #Descricao= flag do tls.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\tls.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "tls copiado." $conteudo
}

function log { 
    #Descricao= PRC de log para debug salvando em tabelas.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\log.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "log copiado." $conteudo
}

function d { 
    #Descricao= Select na tabela da integracao.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\d.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "d copiado." $conteudo
}

function checaparam { 
    #Descricao= Checa os nomes dos parametros.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\CHECAPARAM.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "CHECAPARAM copiado." $conteudo
}

function configempresa { 
    #Descricao= Trata o configuracao de empresa nao encontrada.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\configempresa.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "configempresa copiado." $conteudo
}

function context { 
    #Descricao= Context com usado de forma padrão para os tomcats.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\context.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "context copiado." $conteudo
}
function s2 { 
    #Descricao= descricao da s.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\s2.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "s2 copiado." $conteudo
}
function triggera02 { 
    #Descricao= Trigger que monitora a mensagem formatada e joga a mensagem para A.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\triggera02.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "triggera02 copiado." $conteudo
}

function instancia { 
    #Descricao= Tag de instancia do tomcat.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\instancia.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "instancia copiado." $conteudo
}

function addcondicao { 
    #Descricao= Adiciona condição de envio.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\addcondicao.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "addcondicao copiado." $conteudo
}

function envfirstcons { 
    #Descricao= Script para reenvio da primeira consulta de uma nota fiscal.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\envfirstcons.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "envfirstcons copiado." $conteudo
}

function pw { 
    #Descricao= Link para meu notepadpw, senha : lucas123.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\pw.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "pw copiado." $conteudo
}

function slog { 
    #Descricao= Select para a tabela de log.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\slog.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
     mostrarMensagemPadrao "slog copiado." $conteudo
}





function cedimat { 
    #Descricao= Credenciais de acesso ao cliente CEDIMAT.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\cedimat.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "cedimat copiado." $conteudo
}


function hn { 
    #Descricao= Credenciais para acesso ao HN Panamá.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\hn.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "hn copiado." $conteudo
}

function cem { 
    #Descricao= Select para pegar apenas os últimos 100.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\cem.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "cem copiado." $conteudo
}

function all { 
    #Descricao= Procurar uma coluna em todas as tabela.
    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\all.txt" -Raw -Encoding UTF8
    addQtdUsada $MyInvocation.InvocationName
    mostrarMensagemPadrao "all copiado." $conteudo
}

