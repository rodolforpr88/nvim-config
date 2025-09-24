# Neovim + LazyVim (Rails-ready)

Configuração do meu Neovim baseada no [LazyVim](https://lazyvim.org/), com setup para Ruby on Rails:

- Ruby LSP + ERB LSP
- RuboCop/Standard + ERB Lint via none-ls
- RSpec via neotest
- Git (Fugitive + Gitsigns)
- Qualidade de vida (Oil, Trouble, Telescope)

---

## ✅ Pré-requisitos

- **Neovim ≥ 0.11.2** instalado no sistema (local ou servidor).
- Git, curl, ripgrep e fd instalados.

> Baixe o Neovim conforme sua preferência em **Releases oficiais**:
> 👉 [Página de releases do Neovim](https://github.com/neovim/neovim/releases)

### Opções comuns para instalar o Neovim

- **AppImage (Linux x86_64)**: baixe `nvim-linux-x86_64.appimage`, mova para `/usr/local/bin/nvim` e dê permissão de execução.
  ```bash
  sudo mv /tmp/nvim-linux-x86_64.appimage /usr/local/bin/nvim
  sudo chmod +x /usr/local/bin/nvim
  nvim --version
  ```

- **Tarball (Linux x86_64)**: baixe `nvim-linux64.tar.xz`, extraia em `/opt/nvim` e crie o link:
  ```bash
  sudo tar -xJf /tmp/nvim-linux64.tar.xz -C /opt
  sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
  nvim --version
  ```

> **Observação (Ubuntu 24.04 / Noble):** os PPAs `neovim-ppa` podem não publicar builds para noble em alguns momentos; prefira AppImage/Tarball.

### Dica para servidor via SSH (upload do binário)

Se for instalar o Neovim **num servidor** (e o `curl` de lá não baixar dos releases), baixe no seu PC e envie com `scp`:
```bash
# AppImage
scp ~/Downloads/nvim-linux-x86_64.appimage user@<SERVER_IP>:/tmp/

# Tarball
scp ~/Downloads/nvim-linux64.tar.xz user@<SERVER_IP>:/tmp/
```

Depois finalize no servidor com um dos passos de instalação acima.

---

## 🧩 Instalação da configuração

Antes de clonar, faça backup da configuração antiga (se existir):
```bash
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d-%H%M) 2>/dev/null || true
```

Agora, clone a configuração:
```bash
git clone git@github.com:rodolforpr88/nvim-config.git ~/.config/nvim
```

---

## 🔧 Resolvendo mensagens de versão

Se o LazyVim avisar algo como:
```
LazyVim requires Neovim >= 0.11.2
```
verifique a versão com:
```bash
nvim --version
```
Atualize o Neovim conforme as opções de **Pré-requisitos** acima.

Se o shell continuar mostrando a versão antiga, limpe o cache do Bash:
```bash
hash -r
nvim --version
```

---

## ▶️ Pós-instalação

Abra o Neovim e rode:
```
:checkhealth
:Lazy sync
```
