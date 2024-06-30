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

confirm_overwrite() {
  local dir_name="$1"
  if [ -d "$dir_name" ]; then
    echo -----------------------------------------------------
    echo "Directory '$dir_name' already exists."
    echo "Do you want to DELETE it and create a new one? (yes/no) "
    echo -----------------------------------------------------
    echo
    read -r -p "----> " choice
    echo
    case "$choice" in 
      yes|Yes|y|Y )
        rm -rf "$dir_name"
        echo "Directory '$dir_name' has been deleted."
        echo
        ;;
      no|No|n|N )
        echo "Operation cancelled."
        echo
        exit 1
        ;;
      * )
        echo "Invalid choice. Operation cancelled."
        echo
        exit 1
        ;;
    esac
  fi
}