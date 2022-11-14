# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=vkbasalt-cli
pkgver=3.0
pkgrel=2
pkgdesc="Command-line utility for vkBasalt"
arch=(any)
url="https://gitlab.com/TheEvilSkeleton/vkbasalt-cli"
license=(LGPL3)
depends=(python)
makedepends=(git python-setuptools)
source=("git+https://gitlab.com/TheEvilSkeleton/vkbasalt-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd vkbasalt-cli
  python setup.py build
}

package() {
  cd vkbasalt-cli
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
}