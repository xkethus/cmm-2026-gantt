#!/usr/bin/env bash
# Despliegue de CMM 2026 Gantt a GitHub + Vercel
# Ejecuta este script DENTRO de la carpeta cmm-2026-gantt, en tu computadora.
# Requisitos: GitHub CLI (gh) y Vercel CLI. Si no los tienes, abajo te digo cómo instalarlos.
set -e

REPO_NAME="cmm-2026-gantt"

echo "==> 1. Inicializando repositorio git local"
git init
git add index.html README.md
git commit -m "CMM 2026: Gantt interactivo y saturacion"
git branch -M main

echo "==> 2. Creando el repo PUBLICO en GitHub y subiendo (te pedira login la 1a vez)"
# gh crea el repo en tu cuenta y hace push en un solo paso:
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

echo "==> 3. Desplegando en Vercel (te pedira login la 1a vez)"
# --prod publica directamente en produccion:
vercel --prod --yes

echo "==> Listo. Arriba aparece la URL publica de Vercel."
