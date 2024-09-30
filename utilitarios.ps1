class Funcao {
    [string]$Nome
    [string]$Descricao
}

function f {

    param(
        [string]$Ordernacao = "DESC"
    )
 
    $jsonContent = Get-Content -Path  $CAMINHO_JSON_FUNCTION_NAMES -Raw | ConvertFrom-Json

    $listaFuncoes = @()

    foreach ($obj in $jsonContent) {
        $funcao = [FuncaoJson]::new()
        $funcao.Id = $obj.id
        $funcao.Nome = $obj.nome
        $funcao.Descricao = $obj.descricao
        $funcao.Qtd_usada = $obj.qtd_usada
        $funcao.Sn_interna = $obj.sn_interna
        $listaFuncoes += $funcao
    }

    if ($Ordernacao -eq "DESC") {
        $listaFuncoes = $listaFuncoes | Sort-Object -Property Qtd_usada -Descending
    }
    else {
        $listaFuncoes = $listaFuncoes | Sort-Object -Property Qtd_usada 
    }
 

    do {
        $listaFuncoes | Format-Table Nome, Descricao -AutoSize 

        $escolhaFuncao = Read-Host "Qual funcao deseja escolher "

        if ($escolhaFuncao.Trim().Split(' ') -ge 2 -and ($escolhaFuncao.Trim().Split(' ')[0] -eq 'v' -or $escolhaFuncao.Trim().Split(' ')[0] -eq 'ver') ) {
            $nomeFuncao = $escolhaFuncao.Trim().Split(' ')[1]
            $funcao = $listaFuncoes | Where-Object { $_.Nome -eq $nomeFuncao }
            if ($null -ne $funcao ) {
                Clear-Host

                $nomeF = $funcao.Nome

                Write-Host "Nome da funcao: " $funcao.Nome "`n"
                Write-Host "Descricao: " $funcao.Descricao "`n`n"
                
                $conteudoFuncao = Get-Content -path ("$CAMINHO_BASE\scripts\$($funcao.Nome).txt") -Raw -Encoding UTF8 
                Write-host $conteudoFuncao "`n`n`n"

                $escolha = Read-Host "Pressione Enter para voltar a tela ou C para copiar o conteudo da funcao para a area de transferencia: "
                if ($escolha -eq 'C' -or $escolha -eq 'c') {
                    Clear-Host
                    mostrarMensagemPadrao $funcao.Descricao $conteudoFuncao
                }
            }
            else {
                Write-Host "Funcao nao encontrada" "`n" -ForegroundColor Red 
                Start-Sleep -Milliseconds 1500 
            }
            Clear-Host
        }
        else {
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
        }
    } while ($listaFuncoes.Nome -notcontains $escolhaFuncao)
}

function c {
    #Descricao= Utilitario de pastas.
    param(
        [string]$inputNamePasta,
        [string]$apenasPesquisar = 'nao'
    )
    $previneLoop = 0
    $caminho = "$CAMINHO_PASTA_DOCUMENTOS\Clientes"

    if ( -not (Test-Path -Path $caminho -PathType Container)) {
        New-Item -ItemType Directory -Path "$CAMINHO_PASTA_DOCUMENTOS\Clientes" -Force
    }

    do {
        $pastasEncontradas = Get-ChildItem -Path $caminho -Directory | Where-Object { $_.Name.ToUpper() -like "*$inputNamePasta*".ToUpper() }

        if ($inputNamePasta -ne "") {
            if ($pastasEncontradas.Count -eq 0 -and $apenasPesquisar -ne 'sim') {
                #Criar nova pasta
                Write-Host "Nova pasta criada... " $inputNamePasta -ForegroundColor Green
                New-Item -ItemType Directory -Path "$caminho\$inputNamePasta" -Force
                Start-Process explorer.exe "$caminho\$inputNamePasta"
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
            Start-Process explorer.exe -ArgumentList $caminho 
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

function cadastrar {
    #Descricao= Cadastrar funcao no powerShell.
    Add-Type -AssemblyName PresentationFramework

    $icon = New-Object System.Windows.Media.Imaging.BitmapImage
    $icon.BeginInit()
    $icon.UriSource = New-Object System.Uri("$CAMINHO_BASE./resources/favicon.ico")
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
            $scriptContent = $textBoxScript.Text.Trim()
            $scriptName = $textBoxNome.Text.Trim()

            # Verifique se o nome e o conteúdo do script estão preenchidos
            if ($scriptName -eq "" -or $scriptContent -eq "") {
                [System.Windows.MessageBox]::Show("Nome e conteudo do script sao obrigatorios!", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif (verificarFuncaoExistente $scriptName) {
                [System.Windows.MessageBox]::Show("Ja existe uma funcao com o nome $scriptName", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif ($scriptName -match '\s') {
                [System.Windows.MessageBox]::Show("O nome da funcao nao pode conter espacos", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif ($scriptName -match '[!@#%^&*.,:;+\-=<>()\[\]{}\\/|?"]') {
                [System.Windows.MessageBox]::Show("O nome da função não pode conter caracteres especiais", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            else {
                # Salve o script

                # Cria a pasta se não existir
                if (-not (Test-Path -Path "$CAMINHO_BASE/scripts" -PathType Container)) {
                    New-Item -Path "$CAMINHO_BASE/scripts" -ItemType Directory -Force
                }

                $scriptContent | Out-File -FilePath "$CAMINHO_BASE/scripts\$scriptName.txt" -Encoding utf8

                $conteudo = formatarFuncao $scriptName $textBoxDescricao.Text

                $conteudo | Out-File -FilePath "$PSScriptRoot\funcoes.ps1" -Append  -Encoding utf8

                cadastrarNovaFuncaoAoJson -Nome $scriptName -Descricao $textBoxDescricao.Text

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

function alterar {
    #Descricao= Alterar script.

    param(
        [string]$nomeScript
    )
    #Descricao= Alterar script no powerShell.
    Add-Type -AssemblyName PresentationFramework

    $icon = New-Object System.Windows.Media.Imaging.BitmapImage
    $icon.BeginInit()
    $icon.UriSource = New-Object System.Uri("$CAMINHO_BASE./resources/favicon.ico")
    $icon.EndInit()

    # Crie uma nova janela WPF
    $window = New-Object System.Windows.Window
    $window.Title = "Alterar Script"
    $window.Width = 500
    $window.Height = 550
    $window.Icon = $icon

    # Crie um StackPanel para organizar os controles
    $stack = New-Object System.Windows.Controls.StackPanel


    $id = getIdFuncao $nomeScript

    $nomeAntigoScript = $nomeScript
    $arquivoFuncoes = Get-Content -Path "$CAMINHO_BASE/funcoes.ps1" -Raw -Encoding UTF8

    if ($nomeScript -eq '' -or $nomeScript -eq $null) {
        [System.Windows.MessageBox]::Show("Nao e possivel alterar um script com nome vazio ou nulo.", "Alterar script", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
        Exit
    }

    if ($arquivoFuncoes -match "(function\s+$nomeAntigoScript\s*{[^}]*})") {
        # O bloco de texto da função encontrada está em $matches[0]
        $blocoFuncao = $matches[0]
    }
    else {
        [System.Windows.MessageBox]::Show("Script $nomeScript nao encontrado.", "Alterar script", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
        Exit
    }

    if ($blocoFuncao -match '#Descricao=(.*)') {
        $descricao = $Matches[0] -replace '#Descricao= ', ''
    }
    else {
        $descricao = ''
        write-host 'Descrição não encontrada'
    }

    $conteudo = Get-Content -Path "$CAMINHO_BASE/scripts/$nomeScript.txt" -Raw -Encoding UTF8

    # Crie um Label e um TextBox para o nome do script
    $labelNome = New-Object System.Windows.Controls.Label
    $labelNome.Content = "Nome do Script:"
    $textBoxNome = New-Object System.Windows.Controls.TextBox
    $textBoxNome.Width = 450
    $textBoxNome.Height = 25
    $textBoxNome.Text = $nomeScript
    # $textBoxNome.IsEnabled = $false

    $labelDescricao = New-Object System.Windows.Controls.Label
    $labelDescricao.Content = "Descricao :"
    $textBoxDescricao = New-Object System.Windows.Controls.TextBox
    $textBoxDescricao.Width = 450
    $textBoxDescricao.Height = 25
    $textBoxDescricao.Text = $descricao
    # $textBoxDescricao.IsEnabled = $false

    # Crie um Label e um TextBox maior para o script
    $labelScript = New-Object System.Windows.Controls.Label
    $labelScript.Content = "Script:"
    $textBoxScript = New-Object System.Windows.Controls.TextBox
    $textBoxScript.Width = 450
    $textBoxScript.Height = 300
    $textBoxScript.AcceptsReturn = $true
    $textBoxScript.VerticalScrollBarVisibility = 'Visible'
    $textBoxScript.Text = $conteudo

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
            $scriptContent = $textBoxScript.Text
            $scriptName = $textBoxNome.Text
            # $scriptContent = $scriptContent
            $descricao = $textBoxDescricao.Text

            $scriptContent = $textBoxScript.Text.Trim()
            $scriptName = $textBoxNome.Text.Trim()
            $descricao = $textBoxDescricao.Text.Trim()

            # Verifique se o nome e o conteúdo do script estão preenchidos
            if ($scriptName -eq "" -or $scriptContent -eq "") {
                [System.Windows.MessageBox]::Show("Nome e conteudo do script sao obrigatorios!", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif (($scriptName -ne $nomeAntigoScript) -and (verificarFuncaoExistente $scriptName)) {
                [System.Windows.MessageBox]::Show("Ja existe uma funcao com o nome $scriptName", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif ($scriptName -match '\s') {
                [System.Windows.MessageBox]::Show("O nome da funcao nao pode conter espacos", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            elseif ($scriptName -match '[!@#%^&*.,:;+\-=<>()\[\]{}\\/|?"]') {
                [System.Windows.MessageBox]::Show("O nome da função não pode conter caracteres especiais", "Erro", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
            }
            else {

                $descricao = $descricao -replace "'", ""
                if ($descricao.Substring($descricao.Length - 1) -ne ".") {
                    $descricao += "."
                }

                $novaReferenciaFuncao = formatarFuncao $scriptName $descricao

                $arquivoFuncoes = $arquivoFuncoes -replace "(\n*function\s+$nomeAntigoScript\s*{[^}]*}\n*)", $novaReferenciaFuncao

                if ($scriptName -ne $nomeAntigoScript) {
                    #alterar nome do arquivo
                    Rename-Item -Path "$CAMINHO_BASE/scripts/$nomeAntigoScript.txt" -NewName "$scriptName.txt"
                }

                # Salve o script
                $scriptContent | Out-File -FilePath "$CAMINHO_BASE/scripts\$scriptName.txt" -Encoding utf8
                
                # $arquivoFuncoes | Out-File -FilePath "$CAMINHO_BASE/funcoes.ps1" -Encoding utf8
                Set-Content -Path "$CAMINHO_BASE/funcoes.ps1" -Value $arquivoFuncoes -Encoding UTF8
                modificarJson -Id $id -Nome $scriptName -Descricao $descricao

                [System.Windows.MessageBox]::Show("Script alterado com sucesso!", "Sucesso", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information) # Feche a janela após salvar
                $window.Close()
                Exit
            }
        })
    $window.AddChild($stack)

    # Exiba a janela
    $null = $window.ShowDialog()
    Exit
}
function formatarFuncao {
    #Descricao=
    param (
        [string]$nomeFuncao,
        [string]$descricao
    )

    $descricao = $descricao -replace "'", ""
    if ($descricao.Substring($descricao.Length - 1) -ne ".") {
        $descricao += "."
    }

    $nomeFuncao = $nomeFuncao -replace "'", ""

    $conteudo = "`nfunction $nomeFuncao { `n" +
    "    #Descricao= " + $descricao + "`n" +
    '    $conteudo = Get-Content -path "$CAMINHO_BASE/scripts\' + $nomeFuncao + ".txt`"" + " -Raw -Encoding UTF8`n" +
    '    addQtdUsada $MyInvocation.InvocationName' + "`n" +
    "    mostrarMensagemPadrao " + "`"$nomeFuncao copiado.`"" + ' $conteudo' + "`n" +
    "}`n"
    return $conteudo
}

#Verificar se uma função existe ignorando a descricao e usando regex
function verificarFuncaoExistente {
    #Descricao=
    param (
        [string]$nomeFuncao
    )

    $arquivosPS1 = Get-ChildItem -Path $CAMINHO_BASE -Filter *.ps1 -Recurse
    $conteudo = ""
    foreach ($arquivo in $arquivosPS1) {
        $conteudo += Get-Content -Path $arquivo.FullName -Raw -Encoding UTF8
    }

    if ($conteudo -match "(function\s+$nomeFuncao\s*{[^}]*})") {
        return $true
    }
    return $false
}

function v {
    param (
        [string]$nome
    )

    Write-Host "Nome da funcao: " $nome "`n"
            
    $conteudoFuncao = Get-Content -path ("$CAMINHO_BASE\scripts\$nome.txt") -Raw -Encoding UTF8 
    Write-host $conteudoFuncao "`n`n`n"

    $escolha = Read-Host "Pressione Enter para voltar a tela ou C para copiar o conteudo da funcao para a area de transferencia: "
    if ($escolha -eq 'C' -or $escolha -eq 'c') {
        Clear-Host
        mostrarMensagemPadrao '' $conteudoFuncao
    }
}