 # set non-standard paths
arch=$(uname -m)
python_version=$(python -V 2>&1 | cut -d' ' -f2 | cut -d'.' -f1-2)
export PATH=$PATH:/opt/openmc/bin:$HOME/.local/lib/python$python_version/site-packages
export PYTHONPATH=$PYTHONPATH:/opt/MOAB/lib/python$python_version/site-packages/pymoab-5.3.0-py$python_version-linux-$arch.egg
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/MOAB/lib
var=`echo /opt/nuclear-data/*hdf5 | head -n1`
export OPENMC_CROSS_SECTIONS=$var/cross_sections.xml

# test geometry build
python ~/.cache/yay/openmc-git/step_to_h5m.py

# test run
python ~/.cache/yay/openmc-git/test_openmc.py

# clean
rm *.xml
rm *.h5
rm *.stl
rm *.h5m
