# Maintainer: JoyL <2936221683@qq.com>
pkgname=reasonix-desktop-bin
pkgver=0.53.0
pkgrel=2
pkgdesc="Terminal-native AI coding agent with DeepSeek API (desktop GUI)"
arch=('x86_64')
options=('!debug')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('reasonix-desktop')
conflicts=('reasonix-desktop')
source=("${pkgname}-${pkgver}.deb::https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}/Reasonix_${pkgver}_amd64.deb")
sha256sums=('f19dfe3e10c5e1f7b68073790e0476bff2f38e729d4e0edf499415b3c948c434')

package() {
    cd "${srcdir}"

    ar x "${pkgname}-${pkgver}.deb"
    tar xf data.tar.gz -C "${pkgdir}"
}
