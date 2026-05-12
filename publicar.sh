#!/bin/bash
# Publica o snapshot no GitHub Pages (dash-kpis-revenue)
# Uso: ./publicar.sh          → commit automático com data/hora
#      ./publicar.sh "msg"    → commit com mensagem personalizada

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

if [ ! -f "data.json" ]; then
  echo "❌ data.json não encontrado. Clique em '💾 Publicar snapshot' no dashboard primeiro."
  exit 1
fi

MSG="${1:-update $(date '+%d/%m/%Y %H:%M')}"

git add data.json index.html
git commit -m "$MSG" 2>/dev/null || echo "ℹ️  Nenhuma alteração para commitar."
git push origin main

echo ""
echo "✅ Publicado! Acesse em ~30s:"
echo "   https://antoniootcm-intera.github.io/dash-kpis-revenue/"
