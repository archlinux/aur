# Maintainer: Kaezr <kaezr.dev at gmail dot com>
pkgname=starpsx-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A WIP PlayStation 1 emulator written in Rust"
arch=('x86_64')
url="https://github.com/kaezrr/starpsx"
license=('GPL-3.0-or-later')
provides=('starpsx')

source=("https://github.com/kaezrr/starpsx/releases/download/v${pkgver}/starpsx-linux-x86_64.zip")
sha256sums=('0266550c2c0cb6c8a6232efc85c1f6481db099260c078c006527d3181cb022b9')

package() {
    cd "${srcdir}/starpsx-linux-x86_64"

    install -Dm755 starpsx "${pkgdir}/usr/bin/starpsx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
