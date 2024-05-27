# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

pkgname=ngrrram-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='A TUI tool to help you type faster and learn new layouts. Includes a free cat.'
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/wintermute-cell/ngrrram"
license=("GPL-3.0-only")

depends=(
    'gcc-libs'
    'glibc'
)
provides=('ngrrram')
conflicts=(
    'ngrrram'
    'ngrrram-git'
)

source=("$pkgname::https://github.com/wintermute-cell/ngrrram/releases/download/v${pkgver}/ngrrram-linux")
sha256sums=('3fca4b27e04fd11d5fbbe4fb75cfe0dec89a6d2292126f48950d7a87ad2ab1c1')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/ngrrram"
}
