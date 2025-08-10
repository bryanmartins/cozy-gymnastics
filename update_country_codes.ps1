$files = @(
    "edit-scores-aa-final.html",
    "edit-scores-bb-final.html", 
    "edit-scores-fx-final.html",
    "edit-scores-qualifiers.html",
    "edit-scores-team-final.html",
    "edit-scores-ub-final.html",
    "edit-scores-vt-final.html",
    "scoreboard-aa-final.html",
    "scoreboard-bb-final.html",
    "scoreboard-fx-final.html",
    "scoreboard-team-final.html",
    "scoreboard-ub-final.html",
    "scoreboard-vt-final.html",
    "start-list-aa-final.html",
    "start-list-qualifiers.html"
)

$oldPattern = @"
        function getCountryCode\(country\) \{
            const codes = \{
                'Brasil': 'br',
                'Estados Unidos': 'us',
                'França': 'fr',
                'Alemanha': 'de'
            \};
            return codes\[country\] \|\| 'xx';
        \}
"@

$newPattern = @"
        function getCountryCode(country) {
            const codes = {
                'Brasil': 'br',
                'Brazil': 'br',
                'BRA': 'br',
                'Estados Unidos': 'us',
                'United States': 'us',
                'USA': 'us',
                'França': 'fr',
                'France': 'fr',
                'FRA': 'fr',
                'Alemanha': 'de',
                'Germany': 'de',
                'GER': 'de',
                'Itália': 'it',
                'Italy': 'it',
                'ITA': 'it',
                'Reino Unido': 'gb',
                'United Kingdom': 'gb',
                'GBR': 'gb',
                'Japão': 'jp',
                'Japan': 'jp',
                'JPN': 'jp',
                'China': 'cn',
                'CHN': 'cn',
                'Rússia': 'ru',
                'Russia': 'ru',
                'RUS': 'ru',
                'Canadá': 'ca',
                'Canada': 'ca',
                'CAN': 'ca',
                'Austrália': 'au',
                'Australia': 'au',
                'AUS': 'au'
            };
            return codes[country] || 'xx';
        }
"@

foreach ($file in $files) {
    $filePath = "c:\Users\bryan\OneDrive\Desktop\brussels-olympic-games\public\$file"
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        $content = $content -replace [regex]::Escape($oldPattern.Trim()), $newPattern.Trim()
        Set-Content $filePath $content -NoNewline
        Write-Host "Updated: $file"
    }
}
