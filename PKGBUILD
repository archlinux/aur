pkgname=nekomote-assets
pkgver=0.5.3
pkgrel=1
pkgdesc="Assets pack for nekomote."
arch=(any)
url=https://github.com/Chocola-X/NekoMoteAssets
license=(CC-BY-NC-SA-4.0)
source=("NekoMoteAssets-${pkgver}.tar.gz::https://github.com/Chocola-X/NekoMoteAssets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c529f4b35f88ff4b9f60353dccfb0fb94710c3c4f1124e70ff9f3e9736fdbb73')

package() {
    mkdir -p "${pkgdir}/usr/share/nekomote"
    cp -a "${srcdir}/NekoMoteAssets-${pkgver}/assets" "${pkgdir}/usr/share/nekomote"
    install -Dm644 "${srcdir}/NekoMoteAssets-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
