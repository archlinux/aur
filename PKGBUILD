# Maintainer: Kaezr <kaezr.dev at gmail dot com>
pkgname=starpsx-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A cross-platform fast Sony PlayStation 1 emulator written in Rust"
arch=('x86_64')
url="https://github.com/kaezrr/starpsx"
license=('GPL-3.0-or-later')
provides=('starpsx')

source=("https://github.com/kaezrr/starpsx/releases/download/v${pkgver}/starpsx-linux-x86_64.zip")
sha256sums=('e359075f501b4891bec27c122b170e42d3c6315ecd54eeb15ad99684a2cc056e')

package() {
    cd "${srcdir}/starpsx-linux-x86_64"

    install -Dm755 starpsx "${pkgdir}/usr/bin/starpsx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
