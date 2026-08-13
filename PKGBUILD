# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=autocycler-bin
_pkgname=autocycler
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool for combining multiple long-read assemblies into a consensus"
arch=('x86_64')
url="https://github.com/rrwick/Autocycler"
license=('GPL-3.0-only')
provides=('autocycler')
conflicts=('autocycler')
options=('!strip' '!debug')
source=(
  "https://github.com/rrwick/Autocycler/releases/download/v${pkgver}/autocycler-linux-x86_64-musl-v${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/rrwick/Autocycler/v${pkgver}/LICENSE"
)
sha256sums=('265a8d727d029c6d137d8fe4b020f3cc476b69d67443497c3c89475e8825b106'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
