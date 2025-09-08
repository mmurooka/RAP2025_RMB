#!/bin/bash

./build.sh

# Target files and directories to watch
WATCH_FILES="*.tex *.bib figs/"

# Display message
echo "🔍 Watching: $WATCH_FILES"
echo "The script will run build.sh when changes are detected..."

# Infinite loop to monitor changes
while true; do
    # Wait for any modification, creation, or deletion in the target files
    set -e
    inotifywait -e modify -e create -e delete -r $WATCH_FILES
    set +e

    # Notify the user
    echo "📄 Changes detected! Running build.sh..."

    # Run the compilation script
    ./build.sh
done
