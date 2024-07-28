. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
. ../functions/functions.sh
#------------------------------------------------------------------------------

echo -e "${BLUE}surfaceFeatureExtract ${NC}"
runApplication surfaceFeatureExtract

echo -e "${BLUE}blockMesh ${NC}"
runApplication blockMesh

echo -e "${BLUE}decomposePar ${NC}"
runApplication  decomposePar

echo -e "${BLUE}snappyHexMesh ${NC}"
runParallel  snappyHexMesh

echo -e "${BLUE}topoSet ${NC}"
runParallel  topoSet

echo -e "${BLUE}reconstructParMesh ${NC}"
runApplication reconstructParMesh

echo -e "${BLUE}Removing processors ${NC}"
rm -r processor*

echo -e "${BLUE}checkMesh ${NC}"
runApplication checkMesh

echo ---------------------------------------
echo
echo -e "${GREEN}Meshing done${NC}"
echo
echo

#------------------------------------------------------------------------------
