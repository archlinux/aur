pkgname=nekomote-assets
pkgver=0.5.2
pkgrel=1
pkgdesc="Assets pack for nekomote."
arch=(any)
url=https://github.com/Chocola-X/NekoMoteAssets
license=(CC-BY-NC-SA-4.0)
source=("NekoMoteAssets-${pkgver}.tar.gz::https://github.com/Chocola-X/NekoMoteAssets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0755077c091ff4fec1df72964c82a8f3e9c757b3e16c2401e2dd2a9e2117ff3f')

package() {
    mkdir -p "${pkgdir}/usr/share/nekomote"
    cp -a "${srcdir}/NekoMoteAssets-${pkgver}/assets" "${pkgdir}/usr/share/nekomote"
    install -Dm644 "${srcdir}/NekoMoteAssets-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
