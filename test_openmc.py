################################################################################
#test script

#from https://docs.openmc.org/en/stable/examples/post-processing.html
################################################################################
import openmc

# materials
# 1.6 enriched fuel
fuel = openmc.Material(name='fuel')
fuel.set_density('g/cm3', 10.31341)
fuel.add_nuclide('U235', 3.7503e-4)
fuel.add_nuclide('U238', 2.2625e-2)
fuel.add_nuclide('O16', 4.6007e-2)

# cladding
cladding = openmc.Material(name='cladding')
cladding.set_density('g/cm3', 6.55)
cladding.add_nuclide('Zr90', 7.2758e-3)

# borated water
water = openmc.Material(name='water')
water.set_density('g/cm3', 0.740582)
water.add_nuclide('H1', 4.9457e-2)
water.add_nuclide('O16', 2.4732e-2)
water.add_nuclide('B10', 8.0042e-6)

# Instantiate a Materials collection
materials = openmc.Materials([fuel, water, cladding])

# Export to "materials.xml"
materials.export_to_xml()

#Geometry
h5m_filepath = 'dagmc.h5m'
graveyard=openmc.Sphere(r=10000,boundary_type='vacuum')
cad_univ = openmc.DAGMCUniverse(filename=h5m_filepath,auto_geom_ids=True,universe_id=996 )
cad_cell = openmc.Cell(cell_id=997 , region= -graveyard, fill= cad_univ)
root = openmc.Universe(universe_id=998)
root.add_cells([cad_cell])
geometry = openmc.Geometry(root)
geometry.export_to_xml()

# OpenMC simulation parameters
settings = openmc.Settings()
settings.batches = 100
settings.inactive = 10
settings.particles = 5000

# Create an initial uniform spatial source distribution over fissionable zones
bounds = [-10, -10, -10, 10, 10, 10]
uniform_dist = openmc.stats.Box(bounds[:3], bounds[3:], only_fissionable=True)
settings.source = openmc.Source(space=uniform_dist)

# Export to "settings.xml"
settings.export_to_xml()

# Run OpenMC!
openmc.run()
