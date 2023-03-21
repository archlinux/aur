
import sys
import CAD_to_OpenMC.assembly as ab
a=ab.Assembly()
a.stp_files=["~/.cache/yay/python-cad_to_openmc/src/CAD_to_OpenMC/examples/7pin.step"]
a.import_stp_files()
a.merge_all()
a.solids_to_h5m()
