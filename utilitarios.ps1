class Funcao {
    [string]$Nome
    [string]$Descricao
}

function c {
    #Descricao= Utilitario de pastas.
    param(
        [string]$inputNamePasta,
        [string]$apenasPesquisar = 'nao'
    )
    $previneLoop = 0
    $caminho = 'C:\Users\lucas.matheus\Desktop\Clientes'

    do {
        $pastasEncontradas = Get-ChildItem -Path $caminho -Directory | Where-Object { $_.Name.ToUpper() -like "*$inputNamePasta*".ToUpper() }

        if ($inputNamePasta -ne "") {
            if ($pastasEncontradas.Count -eq 0 -and $apenasPesquisar -ne 'sim') {
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
            elseif ($pastasEncontradas.Count -gt 1) {
                #Várias pastas foram encontradas
                $pastasEncontradas | Format-Table -AutoSize
                $inputNamePasta = Read-Host  "Varias pastas foram encontradas, seja mais especifico. Digite o nome de uma pasta "
            }
            else {
                #Nenhuma pasta foi encontrada
                Read-Host 'Nenhuma pasta foi encontrada...'
                Exit
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
        [int]$tempoFechamento = 300,
        [string]$corTexto = 'Green'
    )

    if ($conteudo -ne $null -and $conteudo -ne '') {
        Set-Clipboard -value $conteudo
    }

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

    if ($mensagem -ne $null -and $mensagem -ne '') {
        printCentralizado $mensagem $corTexto
    }

    Start-Sleep -Milliseconds $tempoFechamento

    if ($tempoFechamento -gt 0) {
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
    $arquivosPS1 = Get-ChildItem -Path $CAMINHO_BASE -Filter *.ps1

    foreach ($arquivo in $arquivosPS1) {
        $conteudo += Get-Content -Path $arquivo.FullName -Raw -Encoding UTF8
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

function cadastrar {
    #Descricao= Cadastrar funcao no powerShell.
    Add-Type -AssemblyName PresentationFramework

    $icon = New-Object System.Windows.Media.Imaging.BitmapImage
    $icon.BeginInit()
    $icon.UriSource = New-Object System.Uri("$CAMINHO_BASE./favicon.ico")
    $icon.EndInit()

    # Crie uma nova janela WPF
    $window = New-Object System.Windows.Window
    $window.Title = "Cadastro de Script"
    $window.Width = 500
    $window.Height = 550
    $window.Icon = $icon

    # Crie um StackPanel para organizar os controles
    $stack = New-Object System.Windows.Controls.StackPanel

    # Crie um Label e um TextBox para o nome do script
    $labelNome = New-Object System.Windows.Controls.Label
    $labelNome.Content = "Nome do Script:"
    $textBoxNome = New-Object System.Windows.Controls.TextBox
    $textBoxNome.Width = 450
    $textBoxNome.Height = 25

    $labelDescricao = New-Object System.Windows.Controls.Label
    $labelDescricao.Content = "Descricao :"
    $textBoxDescricao = New-Object System.Windows.Controls.TextBox
    $textBoxDescricao.Width = 450
    $textBoxDescricao.Height = 25

    # Crie um Label e um TextBox maior para o script
    $labelScript = New-Object System.Windows.Controls.Label
    $labelScript.Content = "Script:"
    $textBoxScript = New-Object System.Windows.Controls.TextBox
    $textBoxScript.Width = 450
    $textBoxScript.Height = 300
    $textBoxScript.AcceptsReturn = $true
    $textBoxScript.VerticalScrollBarVisibility = 'Visible'

    # Crie um botão
    $button = New-Object System.Windows.Controls.Button
    $button.Content = "Salvar Script"
    $button.Width = 150
    $button.Margin = New-Object System.Windows.Thickness(15)

    $stack.Children.Add($labelNome)
    $stack.Children.Add($textBoxNome)
    $stack.Children.Add($labelDescricao)
    $stack.Children.Add($textBoxDescricao)
    $stack.Children.Add($labelScript)
    $stack.Children.Add($textBoxScript)
    $stack.Children.Add($button)

    $button.Add_Click({
            Write-Host "Salvando script..."
            $scriptContent = $textBoxScript.Text
            $scriptName = $textBoxNome.Text

            # Verifique se o nome e o conteúdo do script estão preenchidos
            if ($scriptName -eq "" -or $scriptContent -eq "") {
                [System.Windows.MessageBox]::Show("Nome e conteudo do script sao obrigatorios!", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif (verificarFuncaoExistente $scriptName) {
                [System.Windows.MessageBox]::Show("Ja existe uma funcao com o nome $scriptName", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            else {
                # Salve o script

                # Cria a pasta se não existir
                if (-not (Test-Path -Path "$CAMINHO_BASE/scripts" -PathType Container)) {
                    New-Item -Path "$CAMINHO_BASE/scripts" -ItemType Directory -Force
                }

                $scriptContent | Out-File -FilePath "$CAMINHO_BASE/scripts\$scriptName.txt" -Encoding utf8

                $conteudo = formatarFuncao $scriptName $textBoxDescricao.Text $scriptContent

                $conteudo | Out-File -FilePath "$PSScriptRoot\funcoes.ps1" -Append  -Encoding utf8
                [System.Windows.MessageBox]::Show("Script salvo com sucesso!", "Sucesso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information) # Feche a janela após salvar
                $window.Close()
                Exit
            }
        })

    # Loop até que o nome e o conteúdo do script sejam preenchidos
    $window.AddChild($stack)

    # Exiba a janela
    $null = $window.ShowDialog()
    # Adicione os Labels, TextBoxes e o botão ao StackPanel
    Exit
}

function formatarFuncao {
    #Descricao=
    param (
        [string]$nomeFuncao,
        [string]$descricao,
        [string]$conteudo
    )

    $descricao = $descricao -replace "'", ""
    if ($descricao.Substring($descricao.Length - 1) -ne ".") {
        $descricao += "."
    }

    $nomeFuncao = $nomeFuncao -replace "'", ""


    $conteudo = "`nfunction $nomeFuncao {`n"
    $conteudo += "    #Descricao= " + $descricao + "`n"
    $conteudo += '    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\' + $nomeFuncao + ".txt`"" + " -Raw -Encoding UTF8`n"
    $conteudo += "    mostrarMensagemPadrao " + "`"$nomeFuncao copiado.`"" + ' $conteudo' + "`n"
    $conteudo += "}`n"
    return $conteudo
}


#verificar SOMENTE se ja existe uma função com o nome, ignorando a descricao
function verificarFuncaoExistente {
    #Descricao=
    param (
        [string]$nomeFuncao
    )

    $arquivosPS1 = Get-ChildItem -Path $CAMINHO_BASE -Filter *.ps1
    $conteudo = ""
    foreach ($arquivo in $arquivosPS1) {
        $conteudo += Get-Content -Path $arquivo.FullName -Raw -Encoding UTF8
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

            if ($palavrasSubsequentes[0] -eq $nomeFuncao) {
                return $true
            }
        }
        catch {

        }
    }
    return $false
}