pkgname=nekomote-assets
pkgver=0.6.2
pkgrel=1
pkgdesc="Assets pack for nekomote."
arch=(any)
url=https://github.com/Chocola-X/NekoMoteAssets
license=(CC-BY-NC-SA-4.0)
source=("NekoMoteAssets-${pkgver}.tar.gz::https://github.com/Chocola-X/NekoMoteAssets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a5e24a86f3e1d04c9d317ec3efb33e06bd7bf7726c53403386aca75d67d22ef2')

package() {
    mkdir -p "${pkgdir}/usr/share/nekomote"
    cp -a "${srcdir}/NekoMoteAssets-${pkgver}/assets" "${pkgdir}/usr/share/nekomote"
    install -Dm644 "${srcdir}/NekoMoteAssets-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
