# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.7.7
pkgrel=1
pkgdesc="Clipboard Manager built with Rust & Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('c3b264b3c88e049d555fbd038d9efbc07175d8f1d498efbceb1008de1c7fa353')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
