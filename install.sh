#!/bin/bash

echo "[*] ReconX Installer Started"

# Base directory
INSTALL_DIR="$HOME/.reconx"
BIN_DIR="$HOME/.local/bin"

echo "[*] Creating directories"
mkdir -p "$INSTALL_DIR" "$BIN_DIR"

echo "[*] Copying files"
cp -r modules utils wordlists reconx.sh "$INSTALL_DIR"

echo "[*] Setting permissions"
chmod +x "$INSTALL_DIR/reconx.sh"
chmod +x "$INSTALL_DIR"/modules/*.sh
chmod +x "$INSTALL_DIR"/utils/*.sh

echo "[*] Creating symlink"
ln -sf "$INSTALL_DIR/reconx.sh" "$BIN_DIR/reconx"

# PATH check
if ! echo "$PATH" | grep -q "$BIN_DIR"; then
  echo "[*] Adding ~/.local/bin to PATH"
  echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
  source ~/.bashrc
fi

echo "[✓] ReconX installed successfully"
echo "[✓] Run using: reconx -t example.com --full"
