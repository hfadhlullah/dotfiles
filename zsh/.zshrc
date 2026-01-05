# Lines configured by zsh
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rzr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# export PATH="/usr/bin:$PATH"

# Make completion case-insensitive (dur => Durian-Seeker)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fungsi pencarian folder recursive
dimana() {
  if [[ -z "$1" ]]; then
    echo "❌ Error: Masukkan nama folder yang dicari."
    echo "Contoh: cari dotfiles"
    return 1
  fi
  # Mencari folder dengan nama persis sesuai input
  print -l ~/**/"$1"(D/)
}

# --- Alias Starts Here --- 
alias code='antigravity'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

# bun completions
[ -s "/home/rzr/.bun/_bun" ] && source "/home/rzr/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
