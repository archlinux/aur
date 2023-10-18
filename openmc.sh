# get variables
arch=$(uname -m)
python_version=$(python -V 2>&1 | cut -d' ' -f2 | cut -d'.' -f1-2)
var=`echo /opt/nuclear-data/*hdf5 | head -n1`

# Define the paths
export_path="export PATH=\$PATH:/opt/openmc/bin"
export_pythonpath="export PYTHONPATH=\$PYTHONPATH:/opt/MOAB/lib/python$python_version/site-packages"
export_ld_library_path="export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/MOAB/lib"
export_openmc_cross_sections="export OPENMC_CROSS_SECTIONS=$var/cross_sections.xml"

# set non-standard paths in current session
eval $export_path
eval $export_pythonpath
eval $export_ld_library_path
eval $export_openmc_cross_sections
