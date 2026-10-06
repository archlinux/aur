# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.7.9
pkgrel=1
pkgdesc="Clipboard Manager built with Rust & Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('641479785b752bc95f1c4cee4aeb63cf2e20362998c2afd8d9f9308fd75164be')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
