# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="Clipboard Manager built with Rust & Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('e5c7eee8f80a1e2a7a964bb9cd737ce937a4872cc3b2560975e0db137a0adaed')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
