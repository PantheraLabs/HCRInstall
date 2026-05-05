#!/bin/bash
set -e

# HCR CLI Installer
# One-line install: curl -fsSL https://pantheralabs.github.io/HCRInstall/install.sh | bash

REPO="PantheraLabs/hcr-install"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

# Detect OS and architecture
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "$ARCH" in
    x86_64|amd64) ARCH="x64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

case "$OS" in
    darwin) FILENAME="hcr-macos-${ARCH}" ;;
    linux) FILENAME="hcr-linux-${ARCH}" ;;
    *) echo "Unsupported OS: $OS"; exit 1 ;;
esac

echo "Installing HCR CLI..."
echo "  OS: ${OS}"
echo "  Arch: ${ARCH}"
echo ""

API_URL="https://api.github.com/repos/${REPO}/releases/latest"
AUTH_HEADER=""
if [ -n "$GH_TOKEN" ]; then
    AUTH_HEADER="-H Authorization: token ${GH_TOKEN}"
fi

DOWNLOAD_URL=$(curl -fsSL ${AUTH_HEADER} "${API_URL}" | grep -o '"browser_download_url": "[^"]*' | grep "${FILENAME}" | head -1 | sed 's/.*"browser_download_url": "//')

if [ -z "$DOWNLOAD_URL" ]; then
    echo "Error: Could not find binary for ${FILENAME}"
    exit 1
fi

echo "Downloading ${FILENAME}..."

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

curl -fsSL --progress-bar ${AUTH_HEADER} "${DOWNLOAD_URL}" -o "${TMPDIR}/hcr"
chmod +x "${TMPDIR}/hcr"

echo ""
echo "Installing to ${INSTALL_DIR}..."
if [ -w "$INSTALL_DIR" ]; then
    mv "${TMPDIR}/hcr" "${INSTALL_DIR}/hcr"
else
    sudo mv "${TMPDIR}/hcr" "${INSTALL_DIR}/hcr"
fi

if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    export PATH="${INSTALL_DIR}:${PATH}"
fi

echo ""
echo "HCR installed!"
echo "Run: hcr --help"
