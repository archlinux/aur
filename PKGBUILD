pkgname=nekomote-assets
pkgver=0.7.1
pkgrel=1
pkgdesc="Assets pack for nekomote."
arch=(any)
url=https://github.com/Chocola-X/NekoMoteAssets
license=(CC-BY-NC-SA-4.0)
source=("NekoMoteAssets-${pkgver}.tar.gz::https://github.com/Chocola-X/NekoMoteAssets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b616751c1ca9d9e5f5b66dd2711b568cc2647edaf6099ba5616a5afda3b4687e')

package() {
    mkdir -p "${pkgdir}/usr/share/nekomote"
    cp -a "${srcdir}/NekoMoteAssets-${pkgver}/assets" "${pkgdir}/usr/share/nekomote"
    install -Dm644 "${srcdir}/NekoMoteAssets-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
