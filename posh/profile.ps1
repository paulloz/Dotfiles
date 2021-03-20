Import-Module posh-git
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
$GitPromptSettings.BeforePath = '╭─['
$GitPromptSettings.BeforePath.ForegroundColor = [ConsoleColor]::Yellow
$GitPromptSettings.AfterPath = ']'
$GitPromptSettings.AfterPath.ForegroundColor = [ConsoleColor]::Yellow
$GitPromptSettings.PathStatusSeparator = '-'
$GitPromptSettings.PathStatusSeparator.ForegroundColor = [ConsoleColor]::Yellow
$GitPromptSettings.DefaultPromptSuffix = '╰─ '
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Yellow
$GitPromptSettings.LocalWorkingStatusSymbol.ForegroundColor = [System.ConsoleColor]::Magenta
$GitPromptSettings.LocalStagedStatusSymbol.ForegroundColor = [System.ConsoleColor]::Magenta

function prompt {
    $identity  = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity 

    $prompt = ""

    if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        $prompt += Write-Prompt "[" -ForegroundColor ([ConsoleColor]::Yellow)
        $prompt += Write-Prompt "Admin" -ForegroundColor ([ConsoleColor]::Red)
        $prompt += Write-Prompt "]-" -ForegroundColor ([ConsoleColor]::Yellow)
    }

    $prompt += & $GitPromptScriptBlock

    if ($prompt) { "$prompt" } else { " " }
}
