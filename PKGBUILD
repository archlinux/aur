# Maintainer: Chris Watson <cawatson1993@gmail.com>
pkgname=goshot-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A powerful CLI tool and library for creating beautiful code screenshots with customizable window chrome, syntax highlighting, and backgrounds"
arch=('x86_64' 'aarch64')
url="https://github.com/watzon/goshot"
license=('MIT')
optdepends=(
    'wl-clipboard: clipboard support for Wayland'
    'xclip: clipboard support for X11'
)
provides=('goshot')
conflicts=('goshot')

source_x86_64=("goshot_Linux_x86_64.tar.gz::https://github.com/watzon/goshot/releases/download/v${pkgver}/goshot_Linux_x86_64.tar.gz")
source_aarch64=("goshot_Linux_arm64.tar.gz::https://github.com/watzon/goshot/releases/download/v${pkgver}/goshot_Linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 goshot "$pkgdir/usr/bin/goshot"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
