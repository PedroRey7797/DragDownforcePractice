. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
#------------------------------------------------------------------------------

cp -rf ../meshGenerator/3/polyMesh/ constant/

runApplication decomposePar

restore0Dir -processor

runParallel  patchSummary

runParallel  potentialFoam -writephi

runParallel  checkMesh -writeFields '(nonOrthoAngle)' -constant

runParallel  $(getApplication)

runApplication reconstructParMesh -constant

runApplication reconstructPar -latestTime

rm -r processor*

#------------------------------------------------------------------------------
