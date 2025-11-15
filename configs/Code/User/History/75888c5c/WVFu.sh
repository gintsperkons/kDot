SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"


sudo cp -f $SCRIPT_DIR/defaults/pacman.conf /etc/pacman.conf
sudo pacman -Sy --noconfirm



bash $SCRIPT_DIR/scripts/paru.sh



declare -a CONFIG_FOLDERS=(
  "zsh"
)


#Cpy folders
for folder in "${CONFIG_FOLDERS[@]}"; do
    SRC="$SCRIPT_DIR/configs/$folder/"
    DEST="$HOME/.config/$folder/"

    echo "📁 Copying $SRC to $DEST"
    mkdir -p "$DEST"
    cp -r  "$SRC"* "$DEST"
done






# Ordered list of local packages
PKG=(
  "alacritty"
  "zsh"
)



AUR_PKG=(
  "zen-browser-bin"
  "visual-studio-code-bin"
)

declare -A WEB_APPS=(
  ["YouTube"]="https://www.youtube.com"
  ["ClickUp"]="https://app.clickup.com"
  ["Twitch"]="https://www.twitch.tv"
)



phase_install_local_packages() {
    if [[ ${#PKG[@]} -gt 0 ]]; then
        echo "🚀 Installing PACMAN packages..."
        paru -S "${PKG[@]}" --needed --noconfirm
    fi
}

phase_install_aur_packages() {
    if [[ ${#AUR_PKG[@]} -gt 0 ]]; then
        echo "🚀 Installing AUR packages..."
        paru -S "${AUR_PKG[@]}" --needed --noconfirm
    fi
}

phase_install_local_packages
phase_install_aur_packages


if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🔧 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
cp $SCRIPT_DIR/defaults/.zshrc $HOME/.zshrc
