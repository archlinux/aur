# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.5.11
pkgrel=1
pkgdesc="Clipboard Manager built with Rust {{DESCRIPTION}} Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('508ab2885994614e45add98ec4bca4eeb1cf10d7bc46a1523e22e7940946f590')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
