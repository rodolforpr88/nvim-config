#!/usr/bin/env bash
set -euo pipefail

# ===== Config =====
NVIM_VERSION="v0.11.2"                        # versão desejada (ou "stable")
INSTALL_DIR="/opt/nvim"                       # onde o tarball será extraído
BIN_LINK="/usr/local/bin/nvim"                # symlink do binário
CONFIG_DIR="${HOME}/.config/nvim"

echo "=== 🚀 Instalando dependências básicas ==="
if command -v apt >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y git curl build-essential unzip ripgrep fd-find ca-certificates
  # Debian/Ubuntu: fd chama-se fdfind
  if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
    sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
  fi
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y git curl @development-tools unzip ripgrep fd ca-certificates || true
elif command -v pacman >/dev/null 2>&1; then
  sudo pacman -Sy --needed --noconfirm git curl base-devel unzip ripgrep fd ca-certificates
else
  echo "⚠️  Gerenciador de pacotes não suportado. Instale git/curl/ripgrep/fd manualmente."
fi

echo "=== ⬇️  Baixando Neovim ${NVIM_VERSION} ==="
TMPDIR="$(mktemp -d)"
TARBALL_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz"

curl -fL --retry 3 -o "${TMPDIR}/nvim.tar.gz" "${TARBALL_URL}"

echo "=== 📦 Instalando Neovim em ${INSTALL_DIR} ==="
sudo rm -rf "${INSTALL_DIR}"
sudo mkdir -p "${INSTALL_DIR}"
sudo tar -xzf "${TMPDIR}/nvim.tar.gz" -C "${INSTALL_DIR}" --strip-components=1
sudo ln -sf "${INSTALL_DIR}/bin/nvim" "${BIN_LINK}"
rm -rf "${TMPDIR}"

echo "=== ✅ Neovim instalado: $(${BIN_LINK} --version | head -n1) ==="

# ⚠️ não faça backup se o script estiver rodando de dentro da própria pasta
if [ "$(realpath "${PWD}")" = "$(realpath "${CONFIG_DIR}")" ]; then
  echo "=== 🔒 Pulando backup: script executando dentro de ${CONFIG_DIR}"
else
  echo "=== 💾 Backup da config antiga (se houver) ==="
  mv "${CONFIG_DIR}" "${CONFIG_DIR}.bak.$(date +%Y%m%d-%H%M)" 2>/dev/null || true
fi

echo "=== 🔄 Rodando Lazy para instalar plugins ==="
"${BIN_LINK}" --headless "+Lazy! sync" +qa || {
  echo "⚠️  Lazy sync retornou erro. Abra o Neovim manualmente para ver mensagens:"
  echo "    nvim"
}

echo "✅ Instalação concluída!"
echo "   Abra o Neovim com: nvim ."
