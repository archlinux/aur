# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-charmm36
pkgver=201707
pkgrel=1
pkgdesc='CHARMM36 force field in GROMACS format.'
url='http://mackerell.umaryland.edu/charmm_ff.shtml#gromacs'
license=("GPL")
arch=('any')
depends=("gromacs")
source=(http://mackerell.umaryland.edu/download.php?filename=CHARMM_ff_params_files/charmm36-jul2017.ff.tgz)
sha1sums=('b5881c571da0fe3cf064fb4643e0428ad48bbf1c')


package() {
  msg2 "Installing charmm36 forcefield files in Gromacs"
  mkdir -p ${pkgdir}/usr/share/gromacs/top/charmm36.ff
  cp  ${srcdir}/charmm36-*/* ${pkgdir}/usr/share/gromacs/top/charmm36.ff/
  chmod 644 ${pkgdir}/usr/share/gromacs/top/charmm36.ff/*
}
