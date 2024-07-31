#!/bin/sh

# Color definition
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to request confirmation
confirm() {
    while true; do
        # Imprimir la pregunta en rojo
        echo -e "${YELLOW}Are you sure you want to clean? ${GREEN}[S/s/Y/y/yes/Yes]${NC}"
        read -r response
        case "$response" in
            [SsYy]*|yes|YES|Yes)
                return 0  # User confirmed, proceed
                ;;
            [Nn]*|no|NO|No)
                echo -e "${RED}Aborting cleanup.${NC}"
                exit 1  # User did not confirm, exit
                ;;
            *)
                echo -e "${YELLOW}Please answer with ${GREEN}'S', 'si', 'Y', 'yes', ${RED}'N', 'no'.${NC}"
                echo
                ;;
        esac
    done
}

confirm_overwrite() {
  local dir_name="$1"
  if [ -d "$dir_name" ]; then
    echo -----------------------------------------------------
    echo -e "${BLUE}Directory '$dir_name' already exists.${NC}"
    echo -e "${YELLOW}Do you want to DELETE it and create a new one? ${GREEN}(yes${NC}/${RED}no) ${NC}"
    echo -----------------------------------------------------
    echo
    read -r -p "----> " choice
    echo
    case "$choice" in 
      yes|Yes|y|Y )
        rm -rf "$dir_name"
        echo -e "${GREEN}Directory '$dir_name' has been deleted.${NC}"
        echo
        ;;
      no|No|n|N )
        echo -e "${RED}Operation cancelled.${NC}"
        echo
        exit 1
        ;;
      * )
        echo -e "${YELLOW}Please answer with ${GREEN}'S', 'si', 'Y', 'yes', ${RED}'N', 'no'.${NC}"
        echo
        exit 1
        ;;
    esac
  fi
}