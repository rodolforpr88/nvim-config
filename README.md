# Neovim + LazyVim (Rails-ready)

Config do meu Neovim baseada no LazyVim, com setup para Ruby on Rails:
- Ruby LSP + ERB LSP
- RuboCop/Standard + ERB Lint via none-ls
- RSpec via neotest
- Git (Fugitive + Gitsigns)
- Qualidade de vida (Oil, Trouble, Telescope)

## Instalação
```bash
# Clonar repositório
git clone git@github.com:rodolforpr88/nvim-config.git ~/.config/nvim

# entrar no repositório
cd ~/.config/nvim

# permissão de executar
chmod +x install.sh

# executar configuração instalar caso nao tenha ainda
./install.sh
