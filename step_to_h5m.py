
import sys
import CAD_to_OpenMC.assembly as ab
a=ab.Assembly()
a.stp_files=["./fuel_pins.step"]
a.import_stp_files()
a.solids_to_h5m()
