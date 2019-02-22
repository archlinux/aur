# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-2018-complete-charmm36
pkgver=201811
_gromacs_ver=2018.6
pkgrel=2
pkgdesc='CHARMM36 force field in GROMACS format.'
url='http://mackerell.umaryland.edu/charmm_ff.shtml#gromacs'
license=("GPL")
arch=('any')
depends=("gromacs-2018-complete=${_gromacs_ver}")
source=(http://mackerell.umaryland.edu/download.php?filename=CHARMM_ff_params_files/charmm36-nov2018.ff.tgz)
sha1sums=('b953246b458cc6f4ed5bf5ebb761adf5807f6356')


package() {
  msg2 "Installing charmm36 forcefield files in Gromacs"
  mkdir -p ${pkgdir}/usr/local/gromacs/gromacs-${_gromacs_ver}/share/gromacs/top/charmm36.ff
  cp  ${srcdir}/charmm36-*/* ${pkgdir}/usr/local/gromacs/gromacs-${_gromacs_ver}/share/gromacs/top/charmm36.ff/
  chmod 644 ${pkgdir}/usr/local/gromacs/gromacs-${_gromacs_ver}/share/gromacs/top/charmm36.ff/*
}
