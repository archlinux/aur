CheckMATE
=======

[![AUR badge][AUR badge]][AUR]

CheckMATE installer Arch Linux.

[CheckMATE][homepage] (Check Models At Terascale Energies) is a program package
which accepts simulated event files in many formats for any given model.  The
program then determines whether the model is excluded or not at 95% C.L.  by
comparing to many recent experimental analyses.  Furthermore the program can
calculate confidence limits and provide detailed information about signal
regions of interest.  It is simple to use and the program structure allows for
easy extensions to upcoming LHC results in the future.


CheckMATE is built upon the tools and hard work of many people. If CheckMATE is used in your publication it is important that all of the following citations are included:

- Delphes 3:

  > Favereau, J. De, et al. "DELPHES 3: a modular framework for fast simulation
  > of a generic collider experiment." *Journal of High Energy Physics*.
  > [doi:10.1007/jhep02(2014)057](https://doi.org/10.1007/jhep02(2014)057).

- FastJet:

  > Cacciari, Matteo, et al. "FastJet user manual." *The European Physical
  > Journal C*.
  > [doi:10.1140/epjc/s10052-012-1896-2](https://doi.org/10.1140/epjc/s10052-012-1896-2).

  and

  > Cacciari, Matteo, and Gavin P Salam. "FastJet: Dispelling the N3 Myth for
  > the kt jet-finder."  *Physics Letters B*.
  > [doi:10.1142/9789812706706_0111](https://doi.org/10.1142/9789812706706_0111).

- Anti-kt jet algorithm:

  > Cacciari, Matteo, et al. "The anti- k t jet clustering algorithm." *Journal
  > of High Energy Physics*.
  > [doi:10.1088/1126-6708/2008/04/063](https://doi.org/10.1088/1126-6708/2008/04/063).

- CLs prescription:

  > Read, Alexander L. "Presentation of search results: the CLs technique."
  > *Journal of Physics G: Nuclear and Particle Physics*
  > [doi:10.1088/0954-3899/28/10/313](https://doi.org/10.1088/0954-3899/28/10/313)
  
For analyses that use the MT2 family of kinematical discriminants:

- [Oxbridge Kinetics Library](http://www.hep.phy.cam.ac.uk/~lester/mt2/) ():

  > Lester, Christopher G., and D. J. Summers. "Measuring masses of
  > semi-invisibly decaying particle pairs produced at hadron colliders."
  > *Physics Letters B*.
  > [doi:10.1016/S0370-2693(99)00945-4][OKL_doi]
  
  and
  
  > Barr, Alan, Christopher Lester, and Phil Stephens. "A variable for measuring
  > masses at hadron colliders when missing energy is expected; mT2: the truth
  > behind the glamour." *Journal of Physics G: Nuclear and Particle*.
  > [doi:10.1088/0954-3899/29/10/304](https://doi.org/10.1088/0954-3899/29/10/304)

- Cheng and Han Algorithm:

  > Cheng, Hsin-Chia, and Zhenyu Han. "Minimal kinematic constraints and MT2."
  > *Journal of High Energy Physics*.
  > [doi:10.1088/1126-6708/2008/12/063](https://doi.org/10.1088/1126-6708/2008/12/063)

- MT2bl:
  
  > Bai, Yang, et al. "Stop the top background of the stop search." *Journal of
  > High Energy Physics*.
  > [doi:10.1007/JHEP07(2012)110][MT2bl_doi]

For analyses that use the MCT family of kinematical discriminants:

- MCT

  > Tovey, Daniel R. "On measuring the masses of pair-produced semi-invisibly
  > decaying particles at hadron colliders." *Journal of High Energy
  > Physics*.
  > [doi:10.1088/1126-6708/2008/04/034](https://doi.org/10.1088/1126-6708/2008/04/034)

- MCT corrected,

  > Polesello, Giacomo, and Daniel R. Tovey. "Supersymmetric particle mass
  > measurement with the boost-corrected contransverse mass." *Journal of High
  > Energy Physics*.
  > [doi:10.1007/JHEP03(2010)030][MCTc_doi]

- MCT parallel and perpendicular,

  > Matchev, Konstantin T., and Myeonghun Park. "General method for determining
  > the masses of semi-invisibly decaying particles at Hadron colliders."
  > *Physical review letters*.
  > [doi:10.1103/PhysRevLett.107.061801](https://doi.org/10.1103/PhysRevLett.107.061801)

For analyses that use topness:

- [Topness](https://github.com/michaelgraesser/topness),
  
  > Graesser, Michael L., and Jessie Shelton. "Hunting mixed top squark decays."
  > *Physical review letters*.
  > [doi:10.1103/PhysRevLett.111.121802](https://doi.org/10.1103/PhysRevLett.111.121802)


[homepage]: http://checkmate.hepforge.org/
[AUR]: https://aur.archlinux.org/packages/checkmate/
[AUR badge]: https://img.shields.io/aur/version/checkmate.svg
[OKL_doi]: https://doi.org/10.1016/S0370-2693(99)00945-4
[MT2bl_doi]: https://doi.org/10.1007/JHEP07(2012)110
[MCTc_doi]: https://doi.org/10.1007/JHEP03(2010)030
