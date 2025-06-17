$CAMINHO_BASE = $PSScriptRoot #Caminho da pasta onde este script roda
$CAMINHO_PASTA_DOCUMENTOS = [System.IO.Path]::Combine($env:USERPROFILE, 'Documents')

$CAMINHO_FAVICON = "$CAMINHO_BASE./resources/favicon.ico"

$PASTA_PAI_PROJETO = [System.IO.Directory]::GetParent($PSScriptRoot).FullName
$CAMINHO_JSON_FUNCTION_NAMES = [System.IO.Path]::Combine($PASTA_PAI_PROJETO, 'data','function_names.json')
$CAMINHO_FUNCOES_PS1 = [System.IO.Path]::Combine($PASTA_PAI_PROJETO , 'data','funcoes.ps1')
$CAMINHO_PASTA_SCRIPTS = [System.IO.Path]::Combine($PASTA_PAI_PROJETO , 'data','scripts')
$CAMINHO_PERSONALIZADOS = [System.IO.Path]::Combine($PASTA_PAI_PROJETO , 'data','personalizados.ps1')
."$PSScriptRoot/manipuladores_json.ps1" #Import de utilitarios

$arquivos = @(    
    $CAMINHO_FUNCOES_PS1,
    $CAMINHO_PERSONALIZADOS
)

if (-not (Test-Path $CAMINHO_PASTA_SCRIPTS)) {
    Write-Warning "[>_CIDA] Pasta de scripts nao encontrada. Criando..."
    New-Item -Path $CAMINHO_PASTA_SCRIPTS -ItemType Directory -Force | Out-Null
}

foreach ($arquivo in $arquivos) {
    if (-not (Test-Path $arquivo)) {
        Write-Warning "[>_CIDA] Arquivo '$arquivo' nao encontrado. Criando..."
        New-Item -Path $arquivo -ItemType File -Force | Out-Null
    }
    . $arquivo
}

# Garante que o JSON exista
if (-not (Test-Path $CAMINHO_JSON_FUNCTION_NAMES)) {
    Write-Warning "[>_CIDA] Arquivo JSON '$CAMINHO_JSON_FUNCTION_NAMES' nao encontrado. Criando vazio..."
    New-Item -Path $CAMINHO_JSON_FUNCTION_NAMES -ItemType File -Force | Out-Null     
} 

."$PSScriptRoot/utilitarios.ps1" #Import de utilitarios