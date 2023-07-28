Import-Module posh-git
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
$GitPromptSettings.BeforePath = '─['
$GitPromptSettings.BeforePath.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.AfterPath = ']'
$GitPromptSettings.AfterPath.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.PathStatusSeparator = '─'
$GitPromptSettings.PathStatusSeparator.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.DelimStatus = ' ·'
$GitPromptSettings.DelimStatus.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.DefaultPromptSuffix = '╰─ '
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.EnableStashStatus = $True
$GitPromptSettings.BranchColor.ForegroundColor = [System.ConsoleColor]::Yellow
$GitPromptSettings.LocalWorkingStatusSymbol.ForegroundColor = [System.ConsoleColor]::Yellow
$GitPromptSettings.LocalStagedStatusSymbol.ForegroundColor = [System.ConsoleColor]::Green
$GitPromptSettings.StashColor.ForegroundColor = [System.ConsoleColor]::DarkGreen
$GitPromptSettings.BeforeStash = ' · '
$GitPromptSettings.BeforeStash.ForegroundColor = [System.ConsoleColor]::Magenta
$GitPromptSettings.AfterStash = '↘'
$GitPromptSettings.AfterStash.ForegroundColor = [System.ConsoleColor]::DarkGreen

Set-PSReadlineOption -ExtraPromptLineCount 1

function prompt {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity 

    $prompt = Write-Prompt "╭" -ForegroundColor ([ConsoleColor]::Magenta)

    if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        $prompt += Write-Prompt "─[" -ForegroundColor ([ConsoleColor]::Magenta)
        $prompt += Write-Prompt "Admin" -ForegroundColor ([ConsoleColor]::Red)
        $prompt += Write-Prompt "]" -ForegroundColor ([ConsoleColor]::Magenta)
    }

    $prompt += & $GitPromptScriptBlock

    if ($prompt) { "$prompt" } else { " " }
}
