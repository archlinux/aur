# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=aminal-bin
pkgver=Nightly.develop.2020.01.26.4033a8b
_pkgver=Nightly-develop-2020-01-26-4033a8b
pkgrel=2
pkgdesc='A modern cross-platform terminal emulator in Go'
arch=('x86_64')
url="https://github.com/liamg/aminal"
license=('GPL3')
depends=('libxinerama'
		 'libxcursor'
		 'libglvnd'
		 'libxrandr')
provides=('aminal')
source=("https://github.com/liamg/aminal/releases/download/${_pkgver}/aminal-linux-amd64")
sha256sums=('d605bae58fa2f005daaf7c060e6f4c28dac465bb2c4da5a60b47109703d9740b')

package() {
  install -Dm755 "${srcdir}"/aminal-* "${pkgdir}/usr/bin/aminal"
}
# vim:set ts=2 sw=2 et: