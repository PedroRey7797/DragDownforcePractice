#!/bin/sh

# Source the functions file
. ./functions/functions.sh

# Request user confirmation
echo
echo
echo This operation will clean MESH and RESULTS
echo
confirm

# If the user confirmed, proceed with the script
cd meshGenerator
bash Allclean.sh

cd ../flowSimulation
bash Allclean.sh

cd ..
