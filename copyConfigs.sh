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
            --exclude "Backups" \
            --exclude "blob_storage" \
            --exclude "Cache" \
            --exclude "CachedConfigurations" \
            --exclude "CachedData" \
            --exclude "CachedExtensionVSIXs" \
            --exclude "CachedProfilesData" \
            --exclude "Code Cache" \
            --exclude "Crashpad" \
            --exclude "DawnGraphiteCache" \
            --exclude "DawnWebGPUCache" \
            --exclude "Dictionaries" \
            --exclude "GPUCache" \
            --exclude "Local Storage" \
            --exclude "logs" \
            --exclude "Service Worker" \
            --exclude "Shared Dictionary" \
            --exclude "WebStorage" \
            --exclude "User/globalStorage" \
            --exclude "User/History" \
            --exclude "User/workspaceStorage" \
            --exclude "code.lock" \
            --exclude "Cookies" \
            --exclude "Cookies-journal" \
            --exclude "DIPS" \
            --exclude "DIPS-wal" \
            --exclude "languagepacks.json" \
            --exclude "machineid" \
            --exclude "Network Persistent State" \
            --exclude "SharedStorage" \
            --exclude "Session Storage" \
            --exclude "SharedStorage-wal" \
            --exclude "TransportSecurity" \
            --exclude "Trust Tokens" \
            --exclude "Trust Tokens-journal" \
            "$SRC/" "$DEST/"
    else
        rsync -av --delete "$SRC/" "$DEST/"
    fi
done

# ---- CONFIG FILES ----
declare -a CONFIG_FILES=(
  "kwinrc"
)

for file in "${CONFIG_FILES[@]}"; do
    SRC="$HOME/.config/$file"
    DEST="$SCRIPT_DIR/configs"

    echo "📄 Copying file $SRC → $DEST"
    mkdir -p "$DEST"

    # Copy the file directly
    cp -f "$SRC" "$DEST/"
done
