. ${WM_PROJECT_DIR:?}/bin/tools/CleanFunctions      # Tutorial clean functions
. ../functions/functions.sh

#------------------------------------------------------------------------------

cleanCase0

# Crear archivo mesh.foam con contenido específico
echo "FoamFile {
    version     2.0;
    format      ascii;
    class       dictionary;
    object      mesh;
}" > mesh.foam

#------------------------------------------------------------------------------
