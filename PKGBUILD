# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.17.0
pkgrel=2
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=()
source=("hcclient-${pkgver}-arch.tar.gz::${url}/releases/download/v$pkgver/hcclient-${pkgver}-arch.tar.gz")
sha256sums=('fe5da938bec8dec03bce24a6fddb8d6f121c88d4b0f0ab5c1f1cd6e94f1605e2')

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
