#!/bin/sh

# Function to request confirmation
confirm() {
    while true; do
        read -r -p "Are you sure you want to clean? [S/s/Y/y/yes/Yes] " response
        case "$response" in
            [SsYy]*|yes|YES|Yes)
                return 0  # User confirmed, proceed
                ;;
            [Nn]*|no|NO|No)
                echo "Aborting cleanup."
                exit 1  # User did not confirm, exit
                ;;
            *)
                echo "Please answer with 'S', 'si', 'Y', 'yes', 'N', 'no'."
                ;;
        esac
    done
}
