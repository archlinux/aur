# Maintainer: sandwichfarm <sandwich.farm@protonmail.com>

pkgname=nsyte-bin
pkgver=0.27.1
pkgrel=1
pkgdesc="Publish your site to nostr and blossom servers"
arch=('x86_64')
url="https://github.com/sandwichfarm/nsyte"
license=('MIT')
provides=('nsyte')
conflicts=('nsyte' 'nsite-git')
source_x86_64=(
  "nsyte-linux-${pkgver}::${url}/releases/download/v${pkgver}/nsyte-linux-${pkgver}"
)
sha256sums_x86_64=('843dffc50d6e8834b9814fe8c9422736d21ec3a609629fb032f1b250a465a653')

package() {
  install -Dm755 "nsyte-linux-${pkgver}" "${pkgdir}/usr/bin/nsyte"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
MIT License - see https://github.com/sandwichfarm/nsyte/blob/main/LICENSE
LICENSE
}
