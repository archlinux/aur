# Maintainer: 0-don <https://github.com/0-don>
pkgname=clippy-rs-bin
pkgver=1.7.6
pkgrel=1
pkgdesc="Clipboard Manager built with Rust & Typescript"
arch=('x86_64')
url="https://github.com/0-don/clippy"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3')
provides=('clippy-rs')
conflicts=('clippy-rs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/clippy_${pkgver}_amd64.deb")
sha256sums=('592555663a2c1003e61fe6c1b3a6d139b375afe7304829604d1b8046b9ffada8')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
}
