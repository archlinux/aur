 
# set non-standard paths
export PATH=$PATH:/opt/openmc/bin:$HOME/.local/lib/python3.10/site-packages
export PYTHONPATH=$PYTHONPATH:/opt/MOAB/lib/python3.10/site-packages/pymoab-5.3.0-py3.10-linux-x86_64.egg
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/MOAB/lib
var=`echo /opt/nuclear-data/*hdf5 | head -n1`
export OPENMC_CROSS_SECTIONS=$var/cross_sections.xml

# test geometry build
python step_to_h5m.py

# test run
python test_openmc.py

# clean
rm *.xml
rm *.h5
rm *.stl
rm *.h5m
rm *.vtk
