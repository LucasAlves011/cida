."$PSScriptRoot/utilitarios.ps1" #Import de utilitarios
."$PSScriptRoot/funcoes.ps1"
."$PSScriptRoot/resources/personalizados.ps1"
."$PSScriptRoot/manipuladores_json.ps1"

$CAMINHO_BASE = $PSScriptRoot #Caminho da pasta onde este script roda
$CAMINHO_PASTA_DOCUMENTOS = [System.IO.Path]::Combine($env:USERPROFILE, 'Documents')

$CAMINHO_FAVICON = "$CAMINHO_BASE./resources/favicon.ico"

$PASTA_PAI_PROJETO = [System.IO.Directory]::GetParent($PSScriptRoot).FullName
$CAMINHO_JSON_FUNCTION_NAMES = [System.IO.Path]::Combine($PASTA_PAI_PROJETO, '\data\function_names.json')
$CAMINHO_FUNCOES_PS1 = [System.IO.Path]::Combine($PASTA_PAI_PROJETO , '\data\funcoes.ps1')
$CAMINHO_PASTA_SCRIPTS = [System.IO.Path]::Combine($PASTA_PAI_PROJETO , '\data\scripts')
