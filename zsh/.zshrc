# Added by ForgeCode installer
export PATH="/home/rzr/.local/bin:$PATH"
# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/home/rzr/.zsh/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

# ---- zsh basics ----
export EDITOR=nvim
setopt autocd
setopt correct
setopt no_beep

# ---- history ----
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt share_history

# ---- completion ----
autoload -Uz compinit
compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# ---- starship prompt ----
eval "$(starship init zsh)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/rzr/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

# Flutter SDK
export FLUTTER_HOME="$HOME/tools/flutter"
export PATH="$FLUTTER_HOME/bin:$PATH"

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"

# >>> forge initialize >>>
# !! Contents within this block are managed by 'forge zsh setup' !!
# !! Do not edit manually - changes will be overwritten !!

# Add required zsh plugins if not already present
if [[ ! " ${plugins[@]} " =~ " zsh-autosuggestions " ]]; then
    plugins+=(zsh-autosuggestions)
fi
if [[ ! " ${plugins[@]} " =~ " zsh-syntax-highlighting " ]]; then
    plugins+=(zsh-syntax-highlighting)
fi

# Load forge shell plugin (commands, completions, keybindings) if not already loaded
if [[ -z "$_FORGE_PLUGIN_LOADED" ]]; then
    eval "$(forge zsh plugin)"
fi

# Load forge shell theme (prompt with AI context) if not already loaded
if [[ -z "$_FORGE_THEME_LOADED" ]]; then
    eval "$(forge zsh theme)"
fi
# <<< forge initialize <<<
alias openrgb="QT_QPA_PLATFORM=xcb openrgb"

# yazi auto open path
function finder() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd "$cwd"
	fi
	rm -f "$tmp"
}
