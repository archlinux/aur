 # set non-standard paths
bash set_paths.sh

# test geometry build
python ~/.cache/yay/openmc-git/step_to_h5m.py

# test run
python ~/.cache/yay/openmc-git/test_openmc.py

# clean
rm *.xml
rm *.h5
rm *.stl
rm *.h5m
