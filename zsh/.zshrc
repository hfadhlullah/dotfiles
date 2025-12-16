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

# --- Alias Starts Here --- 
alias code='antigravity'

eval "$(starship init zsh)"
