# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.5.8
pkgrel=1
pkgdesc="Clipboard Manager built with Rust {{DESCRIPTION}} Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('427dcd28f807ae0171447d0f5fbd3df591944f334dbad084cbe820ca219e2899')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
