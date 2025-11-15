sudo pacman -Syu

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

bash $SCRIPT_DIR/scripts/paru.sh








declare -a CONFIG_FOLDERS=(
)


#Cpy folders
for folder in "${CONFIG_FOLDERS[@]}"; do
    SRC="$SCRIPT_DIR/configs/$folder/"
    DEST="$HOME/.config/$folder/"

    echo "📁 Copying $SRC to $DEST"
    mkdir -p "$DEST"
    cp -r  "$SRC"* "$DEST"
done















