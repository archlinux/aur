# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python2-pylast
pkgver=2.4.0
pkgrel=2
pkgdesc='A Python interface to Last.fm and Libre.fm (for python2)'
arch=('any')
url='https://github.com/pylast/pylast'
license=('Apache')
depends=('python2-six')
makedepends=('git' 'python2-setuptools')
source=("git+https://github.com/pylast/pylast.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd pylast

  python2 setup.py build
}

package() {
  cd pylast

  python2 setup.py install --root="${pkgdir}" --optimize='1' --skip-build
}

# vim: ts=2 sw=2 et:
