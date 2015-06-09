# $Id$
# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=1.2.1
pkgrel=1
pkgdesc='A Python interface to the last.fm API'
arch=('any')
url='https://github.com/pylast/pylast'
license=('Apache')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/pylast/pylast/archive/${pkgver}.tar.gz")
sha256sums=('721526d94e579ce005cfaa96ad6ed39dde07e6379d011065969f74f9ba4da9ee')

build() {
  cd ${pkgname#*-}-$pkgver

  python setup.py build
}

package() {
  cd ${pkgname#*-}-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
