# Maintainer: PJ Anarchist <phillipjnr@tuta.io>
pkgname=panagement-bin
pkgver=2.8
pkgrel=3
pkgdesc="FREE reverb/spatialization plugin with depth and character - Auburn Sounds (VST3 format)"
arch=('x86_64')
url="https://www.auburnsounds.com/products/Panagement.html"
license=('custom:proprietary')
depends=()
makedepends=('unzip')
options=('!debug')
source=("https://www.auburnsounds.com/downloads/Panagement-FREE-${pkgver}.zip")
sha256sums=('5d8cf4804d839de97a02bbee40cdd67fa13971813e506111aceaac87b6640078')

package() {
    cd "${srcdir}"
    unzip -oq "Panagement-FREE-${pkgver}.zip"
    
    install -dm755 "${pkgdir}/usr/lib/vst3"
    
    cp -r "Panagement-FREE-${pkgver}/Linux/Linux-64b-VST3-FREE/Auburn Sounds Panagement 2.vst3" \
          "${pkgdir}/usr/lib/vst3/"
}