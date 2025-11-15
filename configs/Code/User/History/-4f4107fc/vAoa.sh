
#!/usr/bin/env bash
set -e

# Directory containing all PKGBUILD subdirectories

declare -a CONFIG_FOLDERS=(
)


#Cpy folders
for folder in "${CONFIG_FOLDERS[@]}"; do
    SRC="$NYXTRA_CONFIG/$folder/"
    DEST="$HOME/.config/$folder/"

    echo "📁 Copying $SRC to $DEST"
    mkdir -p "$DEST"
    cp -r  "$SRC"* "$DEST"
done

hyprctl reload