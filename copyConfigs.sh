#!/usr/bin/env bash
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# ---- CONFIG FOLDERS ----
declare -a CONFIG_FOLDERS=(
  "zsh"
  "Code"
)

for folder in "${CONFIG_FOLDERS[@]}"; do
    SRC="$HOME/.config/$folder"
    DEST="$SCRIPT_DIR/configs/$folder"

    echo "📁 Copying folder $SRC → $DEST"
    mkdir -p "$DEST"
    if [[ "$folder" == "Code" ]]; then
        echo "   ⚠ Applying VS Code excludes"

        rsync -av --delete \
          --include "User/" \
          --include "settings.json" \
          --include "keybindings.json" \
          --include "Preferences" \
          --include "snippets/" \
          --exclude "*" \
          "$SRC/" "$DEST/"
    else
        rsync -av --delete "$SRC/" "$DEST/"
    fi
done

# ---- CONFIG FILES ----
declare -a CONFIG_FILES=(
  "discoverrc"
  "dolphinrc"
  "gtkrc"
  "gtkrc-2.0"
  "kcmfonts"
  "kcminputrc"
  "kded5rc"
  "kglobalshortcutsrc"
  "krdpserverrc"
  "krunnerrc"
  "kscreenlockerrc"
  "ksmserverrc"
  "kwalletrc"
  "kwinoutputconfig.json"
  "kwinrc"
  "kwinrulesrc"
  "ktimezonedrc"
  "mimeapps.list"
  "plasma-localerc"
  "plasmanotifyrc"
  "plasma-org.kde.plasma.desktop-appletsrc"
  "plasmashellrc"
  "plasma-welcomerc"
  "powerdevilrc"
  "powermanagementprofilesrc"
  "systemmonitorrc"
  "systemsettingsrc"
  "Trolltech.conf"
)

for file in "${CONFIG_FILES[@]}"; do
    SRC="$HOME/.config/$file"
    DEST="$SCRIPT_DIR/configs"

    echo "📄 Copying file $SRC → $DEST"
    mkdir -p "$DEST"

    # Copy the file directly
    cp -f "$SRC" "$DEST/"
done
