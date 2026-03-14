pkgname=deezer-tui-bin
pkgver=1
pkgrel=1
pkgdesc="Deezer for the terminal written in Rust, A Deezer TUI client with Discord RPC and MPRIS support"
arch=('x86_64')
url="https://github.com/Minuga-RC/deezer-tui"
license=('MIT')
provides=('deezer-tui')
conflicts=('deezer-tui')
source=("https://github.com/Minuga-RC/deezer-tui/releases/download/v${pkgver}/deezer-tui")
sha256sums=('SKIP')
package() {
    install -Dm755 "${srcdir}/deezer-tui" "${pkgdir}/usr/bin/deezer-tui"
}
