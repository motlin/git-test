# `just --list --unsorted`
default:
    @just --list --unsorted

# Install binary to $XDG_BIN_HOME
install:
    #!/usr/bin/env bash
    set -Eeuo pipefail

    # Use XDG_BIN_HOME if set; otherwise default to ~/.local/bin
    TARGET_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"

    # Ensure the target directory exists
    mkdir -p "$TARGET_DIR"

    # Define the source binary path
    SOURCE_BINARY="{{justfile_directory()}}/bin/git-test"

    # Create or update the symlink
    ln -sf "$SOURCE_BINARY" "$TARGET_DIR/"

    echo "Symlink created: $SOURCE_BINARY -> $TARGET_DIR/"

