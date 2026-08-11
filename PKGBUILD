# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="Clipboard Manager built with Rust & Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('f8ceede1a5e69f70b052238c6e78c81abf45b457dc12241d6d231ed27dde1749')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
