import os
import CAD_to_OpenMC.assembly as ab
filepath = os.environ('HOME')+ "/.cache/yay/openmc-git/fuel_pins.step"
a=ab.Assembly()
a.stp_files=[filepath]
a.import_stp_files()
a.merge_all()
a.solids_to_h5m(h5m_filename = os.environ('HOME') + "/.cache/yay/openmc-git/dagmc.h5m", backend="stl2")
