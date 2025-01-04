#!/bin/bash

# Exit script on any error
set -e

echo "Starting installation..."

# Ensure git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and rerun this script."
    exit 1
fi

# Variables
REPO_URL="https://github.com/maybe-asdf/yaergu-ayva/"
DEST_DIR="$HOME/yaergu-ayva"
HIDDEN_DIR="$HOME/.ayva"
DESKTOP_FILE="ayva.desktop"
APPLICATIONS_DIR="$HOME/.local/share/applications"
BINARY_PATH="/usr/bin/ayva"

# Clone the repository
echo "Cloning repository into $HOME..."
git clone "$REPO_URL" "$DEST_DIR"

# Move the desktop file
echo "Moving $DESKTOP_FILE to $APPLICATIONS_DIR..."
mkdir -p "$APPLICATIONS_DIR"
mv "$DEST_DIR/$DESKTOP_FILE" "$APPLICATIONS_DIR"

# Move the binary file
echo "Moving 'ayva' to /usr/bin/..."
sudo mv "$DEST_DIR/ayva" "$BINARY_PATH"

# Rename the repository folder
echo "Renaming $DEST_DIR to $HIDDEN_DIR..."
mv "$DEST_DIR" "$HIDDEN_DIR"

echo "Installation complete!"
