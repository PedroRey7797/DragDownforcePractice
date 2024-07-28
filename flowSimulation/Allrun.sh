. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
. ../functions/functions.sh
#------------------------------------------------------------------------------

echo -e "${BLUE}Copying mesh ${NC}"
cp -rf ../meshGenerator/3/polyMesh/ constant/

echo -e "${BLUE}decomposePar ${NC}"
runApplication decomposePar

restore0Dir -processor

echo -e "${BLUE}patchSummary ${NC}"
runParallel  patchSummary

echo -e "${BLUE}potentialFoam ${NC}"
runParallel  potentialFoam -writephi

echo -e "${BLUE}checkMesh ${NC}"
runParallel  checkMesh -writeFields '(nonOrthoAngle)' -constant

echo -e "${BLUE}$(getApplication) ${NC}"
runParallel  $(getApplication)

echo -e "${BLUE}reconstructParMesh ${NC}"
runApplication reconstructParMesh -constant

echo -e "${BLUE}reconstructPar ${NC}"
runApplication reconstructPar -latestTime

echo -e "${BLUE}Removing processors ${NC}"
rm -r processor*

echo ---------------------------------------
echo
echo -e "${GREEN}Simulation done${NC}"
echo
echo

#------------------------------------------------------------------------------
