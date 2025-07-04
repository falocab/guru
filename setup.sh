#!/bin/bash

clear
# Colores
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
BLUE=$'\033[1;34m'
YELLOW=$'\033[1;33m'
CYAN=$'\033[0;36m'
ORANGE=$'\033[38;5;208m'
BOLD=$'\033[1m'
NC=$'\033[0m' # Reset


INSTALL_PATH="/usr/local/bin/guru"
SCRIPT_PATH="$(pwd)/guru.py"
MODEL_DIR="$HOME/.local/share/gpt4all"
MODEL_URL="https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/mistral-7b-instruct-v0.1.Q4_0.gguf"
MODEL_FILE="$MODEL_DIR/mistral-7b-instruct-v0.1.Q4_0.gguf"

echo "[${BOLD}${GREEN}*${NC}] ${BLUE}Instalando comando 'guru'...${NC}"
echo "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
chmod +x "$SCRIPT_PATH"
sudo ln -sf "$SCRIPT_PATH" "$INSTALL_PATH"


echo "[${BOLD}${GREEN}*${NC}] ${BLUE}Instalando dependencias de Python...${NC}"
echo "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
pip install gpt4all --break-system-packages

echo "[${BOLD}${GREEN}*${NC}] ${BLUE} Preparando modelo GPT4All (.gguf)...${NC}"
echo "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
mkdir -p "$MODEL_DIR"
cd "$MODEL_DIR"
if [ ! -f "mistral-7b-instruct-v0.1.Q4_0.gguf" ]; then
  echo "[${BOLD}${GREEN}*${NC}] ${BLUE}Descargando modelo Mistral (~1.3GB)...${NC}"
  curl -L -o mistral-7b-instruct-v0.1.Q4_0.gguf "$MODEL_URL"
else
  echo "[${BOLD}${GREEN}*${NC}] ${BLUE}Modelo ya presente.${NC}"
fi

echo "[${BOLD}${GREEN}*${NC}] ${BLUE}Instalación completada. Ya puedes usar 'guru -c "comando"'${NC}"
