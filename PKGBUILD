# Maintainer: baldric <jamesdanielsouth [at] gmail [dot] com>

pkgname=chyron-bin
pkgver=0.5.0
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
b2sums=('5a98e83cff7126deb294f76ad7a21c7c5c37bc892e049193434aa64c6dd92a6c452f44eea89fd919c334544e3384daaa9665fa6a2c183d594e2f7769702f043b'
        '19b0c78a0769f7841b2b05816eb16f7bee75d28e34ae1b8b58829368401570529142783fe01f591f3ccbb01abe42c3272637dbddd0d47a07b58d5bc9c043cf0a')
package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/chyron"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

