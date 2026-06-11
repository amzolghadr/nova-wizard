#!/usr/bin/env bash
set -e

CYAN='\033[1;36m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
BOLD='\033[1m'

OK="${GREEN}[+]${NC}"
ERR="${RED}[-]${NC}"
INFO="${CYAN}[i]${NC}"

REPO="amzolghadr/nova-wizard"
BINARY_NAME="nova-wizard"
INSTALL_DIR="/usr/local/bin"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case "$ARCH" in
  x86_64)  ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  armv7l)  ARCH="arm" ;;
  *)
    echo -e " ${ERR} Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

if [ -d "/data/data/com.termux" ]; then
  INSTALL_DIR="$PREFIX/bin"
  OS="linux"
fi

echo -e "\n${CYAN}${BOLD}"
cat << "LOGO"
 _   _  _____  _   _  ___
| \ | ||  _  || | | |/ _ \
|  \| || | | || | | / /_\ \
| . ' || | | || | | |  _  |
| |\  |\ \_/ /\ \_/ / | | |
\_| \_/ \___/  \___/\_| |_/
LOGO
echo -e "${NC}"
echo -e " ${INFO} Installing Nova-Proxy Wizard for ${BOLD}${OS}/${ARCH}${NC}...\n"

LATEST_URL="https://github.com/${REPO}/releases/latest/download/${BINARY_NAME}-${OS}-${ARCH}"
if [ "$OS" = "windows" ]; then
  LATEST_URL="${LATEST_URL}.exe"
fi

TMP_FILE=$(mktemp)
echo -e " ${INFO} Downloading from GitHub releases..."

if command -v curl &>/dev/null; then
  curl -fsSL "$LATEST_URL" -o "$TMP_FILE"
elif command -v wget &>/dev/null; then
  wget -q "$LATEST_URL" -O "$TMP_FILE"
else
  echo -e " ${ERR} Neither curl nor wget found."
  exit 1
fi

chmod +x "$TMP_FILE"

if [ -w "$INSTALL_DIR" ]; then
  mv "$TMP_FILE" "$INSTALL_DIR/$BINARY_NAME"
elif command -v sudo &>/dev/null; then
  sudo mv "$TMP_FILE" "$INSTALL_DIR/$BINARY_NAME"
else
  mkdir -p "$HOME/.local/bin"
  mv "$TMP_FILE" "$HOME/.local/bin/$BINARY_NAME"
  INSTALL_DIR="$HOME/.local/bin"
  echo -e " ${YELLOW}[!]${NC} Installed to $INSTALL_DIR -- add it to your PATH"
fi

echo -e " ${OK} Nova-Proxy Wizard installed to: ${CYAN}${INSTALL_DIR}/${BINARY_NAME}${NC}"
echo -e " ${OK} Run it with: ${BOLD}${BINARY_NAME}${NC}\n"
