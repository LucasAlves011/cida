class FuncaoJson {
    [System.Guid]$Id
    [string]$Nome
    [string]$Descricao
    [Int32]$Qtd_usada
    [Boolean]$Sn_interna

    [string] ToString() {
        return "Nome: $($this.Nome), Descricao: $($this.Descricao), Qtd_usada: $($this.Qtd_usada), Sn_interna: $($this.Sn_interna)"
    }
}

function getIdFuncao {
    param (
        [string]$Nome
    )

    $jsonContent = Get-Content -Path $CAMINHO_JSON_FUNCTION_NAMES -Raw | ConvertFrom-Json

    $jsonContent | ForEach-Object {
        if ($_.nome -eq $Nome) {
            return $_.id
        }
    }
}

function cadastrarNovaFuncaoAoJson {
    param (
        [string]$Nome,
        [string]$Descricao,
        [Int32]$Qtd_usada = 0,
        [Boolean]$Sn_interna = $false
    )

    $objFuncTemp = @{
        id = [System.Guid]::NewGuid()
        nome = $Nome
        descricao = $Descricao
        qtd_usada = $Qtd_usada
        sn_interna = $Sn_interna
    }

    $jsonContent = Get-Content -Path $CAMINHO_JSON_FUNCTION_NAMES -Raw | ConvertFrom-Json

    $jsonContent += $objFuncTemp

    $jsonString = $jsonContent | ConvertTo-Json -Depth 3
    Set-Content -Path $CAMINHO_JSON_FUNCTION_NAMES -Value $jsonString
}

function modificarJson {
    param (
        [System.Guid]$Id,
        [string]$Nome,
        [string]$Descricao,
        [Int32]$Qtd_usada = 0,
        [Boolean]$Sn_interna = $false
    )

    $jsonContent = Get-Content -Path  $CAMINHO_JSON_FUNCTION_NAMES -Raw | ConvertFrom-Json

    $jsonContent | ForEach-Object {
        if ($_.id -eq $Id) {
            $_.nome = $Nome
            $_.descricao = $Descricao
            $_.qtd_usada = $Qtd_usada
            $_.sn_interna = $Sn_interna
        }
    }

    $jsonString = $jsonContent | ConvertTo-Json -Depth 3
    Set-Content -Path $CAMINHO_JSON_FUNCTION_NAMES -Value $jsonString
}

function addQtdUsada {
    param (
        [string]$Nome
    )

    $Id = getIdFuncao -Nome $Nome

    $jsonContent = Get-Content -Path $CAMINHO_JSON_FUNCTION_NAMES -Raw | ConvertFrom-Json

    $jsonContent | ForEach-Object {
        if ($_.id -eq $Id) {
            $_.qtd_usada += 1
        }
    }

    $jsonString = $jsonContent | ConvertTo-Json -Depth 3
    Set-Content -Path $CAMINHO_JSON_FUNCTION_NAMES -Value $jsonString
}
