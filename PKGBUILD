# Maintainer: Kaezr <kaezr.dev at gmail dot com>
pkgname=starpsx-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A WIP PlayStation 1 emulator written in Rust"
arch=('x86_64')
url="https://github.com/kaezrr/starpsx"
license=('GPL-3.0-or-later')
provides=('starpsx')

source=("https://github.com/kaezrr/starpsx/releases/download/v${pkgver}/starpsx-linux-x86_64.zip")
sha256sums=('80ed88052c9fd525f03301ec08573732a2a01710bc8e869a8cd37e6f8d120002')

package() {
    cd "${srcdir}/starpsx-linux-x86_64"

    install -Dm755 starpsx "${pkgdir}/usr/bin/starpsx"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
