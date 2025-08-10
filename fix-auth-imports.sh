#!/bin/bash

# Script para corrigir todas as páginas que usam módulos ES6 do auth-guard

echo "Corrigindo imports do auth-guard..."

# Lista de arquivos para corrigir
files=(
    "start-list-vt-final.html"
    "start-list-ub-final.html" 
    "start-list-team-final.html"
    "start-list-fx-final.html"
    "start-list-bb-final.html"
    "start-list-aa-final.html"
    "judges-e-backup.html"
    "edit-scores-vt-final.html"
    "edit-scores-ub-final.html"
    "edit-scores-team-final.html"
    "edit-scores-fx-final.html"
    "edit-scores-bb-final.html"
)

for file in "${files[@]}"
do
    if [ -f "$file" ]; then
        echo "Corrigindo $file..."
        sed -i 's/<script type="module" src="js\/auth-guard.js"><\/script>/<script src="js\/auth-guard.js"><\/script>/g' "$file"
    fi
done

echo "Correção concluída!"
