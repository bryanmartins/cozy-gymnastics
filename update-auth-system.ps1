# Script para atualizar todas as páginas para o novo sistema de autenticação por códigos
# Executar na pasta raiz do projeto

Write-Host "Atualizando sistema de autenticação..." -ForegroundColor Green

# Lista de arquivos para atualizar
$files = @(
    "public\edit-scores-qualifiers.html",
    "public\edit-scores-aa-final.html", 
    "public\edit-scores-team-final.html",
    "public\edit-scores-vt-final.html",
    "public\edit-scores-ub-final.html",
    "public\edit-scores-bb-final.html",
    "public\edit-scores-fx-final.html",
    "public\start-list-qualifiers.html",
    "public\start-list-aa-final.html",
    "public\start-list-team-final.html",
    "public\start-list-vt-final.html",
    "public\start-list-ub-final.html",
    "public\start-list-bb-final.html",
    "public\start-list-fx-final.html",
    "public\control.html",
    "public\judges-d.html",
    "public\judges-e.html"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Atualizando: $file" -ForegroundColor Yellow
        
        # Ler conteúdo do arquivo
        $content = Get-Content $file -Raw -Encoding UTF8
        
        # Substituir referência ao auth-guard.js antigo pelo novo
        $content = $content -replace 'js/auth-guard\.js', 'js/auth-guard-codes.js'
        
        # Remover imports do Firebase Auth se existirem (mas manter os outros)
        $content = $content -replace '<script type="module" src="js/auth-guard\.js"></script>', '<script src="js/auth-guard-codes.js"></script>'
        $content = $content -replace '<script src="js/auth-guard\.js">\s*</script>', ''
        
        # Salvar arquivo atualizado
        $content | Set-Content $file -Encoding UTF8
        
        Write-Host "Atualizado: $file" -ForegroundColor Green
    } else {
        Write-Host "Arquivo não encontrado: $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Atualização concluída!" -ForegroundColor Green
Write-Host ""
Write-Host "CÓDIGOS DE ACESSO:" -ForegroundColor Cyan
Write-Host "ADMIN2025  -> Dashboard (Administrador)" -ForegroundColor White
Write-Host "JUDGED2025 -> Jurado D (Dificuldade)" -ForegroundColor White  
Write-Host "JUDGEE2025 -> Jurado E (Execução)" -ForegroundColor White
Write-Host ""
Write-Host "Página de login: login-codes.html" -ForegroundColor Cyan
