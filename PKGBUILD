# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: graysky <graysky AT archlinux DOR us>

pkgname=archey3
# the PKGBUILD at https://github.com/lclarkmichalek/archey3/blob/master/PKGBUILD says 0.5
pkgver=0.5
pkgrel=13
pkgdesc='Output a logo and various system information'
arch=('any')
url='https://lclarkmichalek.github.io/archey3/'
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=('imagemagick: for default screenshot command'
            'python-logbook: alternative logging system')
source=('git+https://github.com/lclarkmichalek/archey3#commit=ac687529ec6208954f09c29f01760c66f73b1d10')
md5sums=('SKIP')

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir"
}

# getver: -d 2 -u 5
# vim: ts=2 sw=2 et:
