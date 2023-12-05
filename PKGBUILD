# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.16.4
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=()
source=("hcclient-${pkgver}-arch.tar.gz::${url}/releases/download/v$pkgver/hcclient-${pkgver}-arch.tar.gz")
sha256sums=('3277163683bd04df47b497373047f5580d739d86de024adf4119c63eb649951a')

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
