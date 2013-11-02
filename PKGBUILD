# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: graysky <graysky AT archlinux DOR us>

pkgname=archey3
pkgver=0.5
pkgrel=1
pkgdesc='Output a logo and various system information'
arch=('any')
url='http://bluepeppers.github.com/archey3'
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=('imagemagick: for default screenshot command')
# AUR optdeps: python-logbook-git and python-mpd-git
source=('git://github.com/bluepeppers/archey3.git#commit=c1d1fedccc843ada034d7bcbfe89d00cfc58fea3')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  grep pkgver= PKGBUILD | cut -d'=' -f2
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir"
} 

# vim:set ts=2 sw=2 et:
