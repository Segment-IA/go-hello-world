#!/bin/sh
# Script para gerar arquivos a partir dos templates substituindo variáveis
# Uso: ./scripts/generate_from_templates.sh <PROJECT_NAME> <BINARY_NAME> <DEV_PORT> <PROD_PORT>

set -e

PROJECT_NAME="$1"
BINARY_NAME="$2"
DEV_PORT="$3"
PROD_PORT="$4"

if [ -z "$PROJECT_NAME" ] || [ -z "$BINARY_NAME" ] || [ -z "$DEV_PORT" ] || [ -z "$PROD_PORT" ]; then
  echo "Uso: $0 <PROJECT_NAME> <BINARY_NAME> <DEV_PORT> <PROD_PORT>"
  exit 1
fi

echo "Gerando arquivos a partir dos templates..."
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g; s/{{BINARY_NAME}}/$BINARY_NAME/g; s/{{DEV_PORT}}/$DEV_PORT/g; s/{{PROD_PORT}}/$PROD_PORT/g" Dockerfile.dev.tmpl > Dockerfile.dev
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g; s/{{BINARY_NAME}}/$BINARY_NAME/g; s/{{DEV_PORT}}/$DEV_PORT/g; s/{{PROD_PORT}}/$PROD_PORT/g" Dockerfile.prod.tmpl > Dockerfile.prod
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g; s/{{BINARY_NAME}}/$BINARY_NAME/g; s/{{DEV_PORT}}/$DEV_PORT/g; s/{{PROD_PORT}}/$PROD_PORT/g" docker-compose.dev.yml.tmpl > docker-compose.dev.yml
sed "s/{{PROJECT_NAME}}/$PROJECT_NAME/g; s/{{BINARY_NAME}}/$BINARY_NAME/g; s/{{DEV_PORT}}/$DEV_PORT/g; s/{{PROD_PORT}}/$PROD_PORT/g" docker-compose.prod.yml.tmpl > docker-compose.prod.yml

echo "Arquivos gerados com sucesso!"
