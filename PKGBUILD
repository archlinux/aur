# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=fortune-tontons-flingueurs-fr
pkgver=20110606
pkgrel=1
pkgdesc="Fortune cookies from french movie Les Tontons Flingeurs"
arch=('i686' 'x86_64')
url="http://fr.wikiquote.org/wiki/Les_Tontons_flingueurs"
license=('unknown')
depends=('fortune-mod')
source=(tontonsflingueurs)
sha1sums=('2f8fe0fe837aa22e010989fe27e0801288965203')

build() {
  cd ${srcdir}
  strfile tontonsflingueurs tontonsflingueurs.dat
}

package() {
  install -d ${pkgdir}/usr/share/fortune/fr
  install -m644 ${srcdir}/tontonsflingueurs* ${pkgdir}/usr/share/fortune/fr
}
