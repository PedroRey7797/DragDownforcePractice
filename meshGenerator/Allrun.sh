. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
#------------------------------------------------------------------------------

runApplication surfaceFeatureExtract

runApplication blockMesh

runApplication  decomposePar

runParallel  snappyHexMesh

runParallel  topoSet

runApplication reconstructParMesh

rm -r processor*

runApplication checkMesh

echo ---------------------------------------
echo
echo "Meshing done"
echo
echo

#------------------------------------------------------------------------------
