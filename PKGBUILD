# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-charmm36
pkgver=202102
pkgrel=1
pkgdesc='CHARMM36 force field in GROMACS format.'
url='http://mackerell.umaryland.edu/charmm_ff.shtml#gromacs'
license=("GPL")
arch=('any')
depends=("gromacs")
source=(http://mackerell.umaryland.edu/download.php?filename=CHARMM_ff_params_files/charmm36-feb2021.ff.tgz)
sha256sums=('480637fddcf47d900d7dcf8240cc8fbcde4178e988913c95126cbfed99775ce9')


package() {
  msg2 "Installing charmm36 forcefield files in Gromacs"
  mkdir -p ${pkgdir}/usr/share/gromacs/top/charmm36.ff
  cp  ${srcdir}/charmm36-*/* ${pkgdir}/usr/share/gromacs/top/charmm36.ff/
  chmod 644 ${pkgdir}/usr/share/gromacs/top/charmm36.ff/*
}
