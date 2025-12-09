# Maintainer: Kaezr <kaezr.dev at gmail dot com>
pkgname=starpsx-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A WIP PlayStation 1 emulator written in Rust"
arch=('x86_64')
url="https://github.com/kaezrr/starpsx"
license=('GPL-3.0-or-later')
provides=('starpsx')

source=("https://github.com/kaezrr/starpsx/releases/download/v${pkgver}/starpsx-linux-x86_64.zip")
sha256sums=('86a382d498d7258aa48e13ef3743cc25fcd1ea36e14321b1c5ba4b404baf8911')

package() {
    cd "${srcdir}/starpsx-linux-x86_64"

    install -Dm755 starpsx "${pkgdir}/usr/bin/starpsx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
