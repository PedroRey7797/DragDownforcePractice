#!/bin/bash

source ../functions/functions.sh # Import functions to be used in this file.

cd ../

echo
echo
echo ----------------------------------------------------
echo -e "${BLUE}Write the name for saving the mesh${NC}"
echo ----------------------------------------------------
echo
read -r -p "----> " response
echo 
echo

# Chequing if the directory name already exist.
confirm_overwrite "$response" # Fucntion defined at DragDownForcePractice/functions/functions.sh

cp -r meshGenerator "$response"
echo -e "${GREEN}Mesh saved at '$response'${NC}"
echo
echo
