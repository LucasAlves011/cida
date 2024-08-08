."$PSScriptRoot/utilitarios.ps1" #Import de utilitarios
."$PSScriptRoot/funcoes.ps1"
."$PSScriptRoot/resources/personalizados.ps1"
."$PSScriptRoot/manipuladores_json.ps1"

$CAMINHO_BASE = $PSScriptRoot #Caminho da pasta onde este script roda
$CAMINHO_PASTA_DOCUMENTOS = [System.IO.Path]::Combine($env:USERPROFILE, 'Documents')
$CAMINHO_JSON_FUNCTION_NAMES = [System.IO.Path]::Combine($CAMINHO_BASE, 'resources\function_names.json')
