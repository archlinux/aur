Delphes
=======

[![AUR badge][AUR badge]][AUR]

Delphes installer Arch Linux.

[Delphes][homepage] is a C++ framework, performing a fast multipurpose detector
response simulation.  The simulation includes a tracking system, embedded into a
magnetic field, calorimeters and a muon system.  The framework is interfaced to
standard file formats (e.g. Les Houches Event File or HepMC) and outputs
observables such as isolated leptons, missing transverse energy and collection
of jets which can be used for dedicated analyses.  The simulation of the
detector response takes into account the effect of magnetic field, the
granularity of the calorimeters and sub-detector resolutions.  Visualisation of
the final state particles is also built-in using the corresponding ROOT library.

If you use Delphes as part of a publication, you should include a citation to:

  > Favereau, J. De, et al. “DELPHES 3: a modular framework for fast simulation
  > of a generic collider experiment.” *Journal of High Energy Physics*.
  > [doi:10.1007/jhep02(2014)057](https://doi.org/10.1007/jhep02(2014)057).

Also, please note that Delphes relies on a few external packages. If they are
used they should be cited as well. For instance, the jet clustering procedure in
Delphes is performed via the ​FastJet package. If your analysis involves jets,
you should explicitly include both a reference for the ​FastJet package and for
the relevant clustering algorithm you are using.


[homepage]: https://cp3.irmp.ucl.ac.be/projects/delphes
[doi]: https://dx.doi.org/10.1007/jhep02(2014)057
[AUR]: https://aur.archlinux.org/packages/delphes/
[AUR badge]: https://img.shields.io/aur/version/delphes.svg
