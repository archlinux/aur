# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="Clipboard Manager built with Rust {{DESCRIPTION}} Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('26a20cd2cfac1e411f4e2d722a3f626a48d2d7b0b4e535e4737d48d44bf0030b')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
