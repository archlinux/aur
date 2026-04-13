# test geometry build
python ~/.cache/yay/openmc-git/step_to_h5m.py

# test run
python ~/.cache/yay/openmc-git/test_openmc.py

# clean
rm ~/.cache/yay/openmc-git/*.xml
rm ~/.cache/yay/openmc-git/*.h5
rm ~/.cache/yay/openmc-git/*.h5m
