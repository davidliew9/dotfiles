echo "🔗 Symlinking dotfiles..."

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "✅ Symlinks created."

echo "📦 Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c \
  "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed."
fi

echo "🎨 Installing Powerlevel10k..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
  echo "Powerlevel10k already installed."
fi

echo "🖋 Setting theme to powerlevel10k in ~/.zshrc..."
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "🖋 Setting theme to powerlevel10k in ~/.zshrc..."
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "🔤 Installing Nerd Fonts (MesloLGS)..."
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

echo "⚡️ Done! Restart your terminal and select 'MesloLGS NF' font in iTerm2."
echo "🚀 Pro tip: Run \`p10k configure\` after restarting terminal to set up your prompt."

