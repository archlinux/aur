# Maintainer: baldric <jamesdanielsouth [at] gmail [dot] com>

pkgname=chyron-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='A CLI text scroller/split-flap for Linux, written in OCaml'
arch=('x86_64')
url='https://github.com/jamessouth/chyron'
license=('MIT')
options=('!debug')
depends=('glibc')
provides=('chyron')
conflicts=('chyron')
source=(
  "${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/chyron"
  "${pkgname}-${pkgver}-LICENSE::${url}/releases/download/v${pkgver}/LICENSE"
)
b2sums=(
  b827826a5dd1c825af01d8134e6dd3744b70a8edec337eb601d0047015ef85cfc8b3e18e912bc8a5374df863b42cd1777753cdf37a71ff6c158ed7806e62e49e
  19b0c78a0769f7841b2b05816eb16f7bee75d28e34ae1b8b58829368401570529142783fe01f591f3ccbb01abe42c3272637dbddd0d47a07b58d5bc9c043cf0a
)
package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/chyron"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

