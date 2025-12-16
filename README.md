# My Dotfiles

My personal configuration files for **Arch Linux, managed with GNU Stow.
Focused on a clean, keyboard-centric workflow using **Niri** (Wayland) and **Neovim**.

![Screenshot](https://via.placeholder.com/800x450?text=Place+Your+Screenshot+Here)
## 🛠️ The Stack

| Category | Tool |
| :--- | :--- |
| **OS** | Arch Linux (CachyOS) |
| **Window Manager** | [Niri](https://github.com/YaLTeR/niri) (Scrollable Tiling) |
| **Terminal** | [Ghostty](https://ghostty.org/) |
| **Shell** | Zsh + Starship |
| **Editor** | Neovim (LazyVim) |
| **Bar** | Waybar |
| **Launcher** | Rofi (Wayland fork) |
| **Multiplexer** | Tmux |

## 🚀 Installation

### 1. Requirements
You need `git` and `stow` installed:
```bash
sudo pacman -S git stow

git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
