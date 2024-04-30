# Maintainer: Evan Chen <evan@evanchen.cc>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: graysky <graysky AT archlinux DOR us>

pkgname=archey3
pkgver=0.5
pkgrel=14
pkgdesc='Output a logo and various system information'
arch=(any)
url='https://lclarkmichalek.github.io/archey3/'
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(git python-distribute)
optdepends=('imagemagick: for default screenshot command'
            'python-logbook: alternative logging system')
source=('git+https://github.com/lclarkmichalek/archey3#commit=ac687529ec6208954f09c29f01760c66f73b1d10')
b2sums=('SKIP')

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir"
}
