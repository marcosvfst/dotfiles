#!/bin/bash

echo "🚀 Iniciando a instalação dos Dotfiles..."

# 1. Detectar o gerenciador de pacotes e instalar o Stow
if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y stow git zsh
elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm stow git zsh
elif command -v brew &> /dev/null; then
    brew install stow git
fi

# 2. Entrar na pasta dos dotfiles
cd ~/.dotfiles

# 3. Remover arquivos que costumam dar conflito (o Stow não sobrescreve arquivos reais)
echo "清理 | Removendo arquivos de config padrões para evitar conflitos..."
rm -rf ~/.zshrc
rm -rf ~/.bashrc
# Adicione outros aqui se necessário, ex: rm -rf ~/.config/nvim

# 4. Rodar o Stow para cada pasta
echo "🔗 Criando links simbólicos com o GNU Stow..."
stow zsh
stow config
stow fonts
stow appearance
stow pictures
stow nvim

# 5. Atualizar o cache de fontes do sistema
if command -v fc-cache &> /dev/null; then
    echo "fontes | Atualizando cache de fontes..."
    fc-cache -f
fi

echo "✅ Tudo pronto! Reinicie o terminal ou dê 'source ~/.zshrc'"
