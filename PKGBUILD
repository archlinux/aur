# Maintainer: Your Name <your@email.com>
pkgname=reasonix-desktop-bin
pkgver=0.52.0
pkgrel=1
pkgdesc="Terminal-native AI coding agent with DeepSeek API (desktop GUI)"
arch=('x86_64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('reasonix-desktop')
conflicts=('reasonix-desktop')
source=("${pkgname}-${pkgver}.deb::https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}/Reasonix_${pkgver}_amd64.deb")
sha256sums=('ebea398cf4185bfdce8e59937611a1df9fb7f00c82c40c8cb065553ac8274b5e')

package() {
    cd "${srcdir}"

    ar x "${pkgname}-${pkgver}.deb"
    tar xf data.tar.gz -C "${pkgdir}"
}
