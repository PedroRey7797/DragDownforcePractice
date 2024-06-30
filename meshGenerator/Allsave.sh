#!/bin/bash

source ../functions/functions.sh # Import functions to be used in this file.

cd ../

echo
echo
echo ----------------------------------------------------
echo Write the name for saving the mesh
echo ----------------------------------------------------
echo
read -r -p "----> " response
echo 
echo

# Chequing if the directory name already exist.
confirm_overwrite "$response" # Fucntion defined at DragDownForcePractice/functions/functions.sh

cp -r meshGenerator "$response"
echo "Mesh saved at '$response'"
echo
echo
