pkgname=nekomote-assets
pkgver=0.7.0
pkgrel=1
pkgdesc="Assets pack for nekomote."
arch=(any)
url=https://github.com/Chocola-X/NekoMoteAssets
license=(CC-BY-NC-SA-4.0)
source=("NekoMoteAssets-${pkgver}.tar.gz::https://github.com/Chocola-X/NekoMoteAssets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1a0a179a546f30fc62e8231db4f07b0ebb72191c491efe2bc029c31e4e272f1')

package() {
    mkdir -p "${pkgdir}/usr/share/nekomote"
    cp -a "${srcdir}/NekoMoteAssets-${pkgver}/assets" "${pkgdir}/usr/share/nekomote"
    install -Dm644 "${srcdir}/NekoMoteAssets-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
