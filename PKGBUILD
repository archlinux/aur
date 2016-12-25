# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: graysky <graysky AT archlinux DOR us>

pkgname=archey3
pkgver=0.5
pkgrel=7
pkgdesc='Output a logo and various system information'
arch=('any')
url='https://lclarkmichalek.github.io/archey3/'
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=('imagemagick: for default screenshot command'
            'python-logbook: alternative logging system')
source=('git://github.com/lclarkmichalek/archey3#commit=1c7e137')
md5sums=('SKIP')

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir"
}

# getver: -d 2 -u 5
# vim:set ts=2 sw=2 et:
