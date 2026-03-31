# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.5.13
pkgrel=1
pkgdesc="Clipboard Manager built with Rust {{DESCRIPTION}} Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('87b1fb8102b7c88e315de417b3c93d08740ea18d0d132a21010c4bfe2ec1bb80')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
