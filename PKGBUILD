# Maintainer: ilija <your-email@example.com>
pkgname=ultralog-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="UltraLog: ClassicMiniDIY's prebuilt binary log viewer (prebuilt, from GitHub releases)"
arch=('x86_64')
url="https://github.com/ClassicMiniDIY/UltraLog"
license=('GPL')
source=("ultralog-linux.tar.gz::https://github.com/ClassicMiniDIY/UltraLog/releases/download/v${pkgver}/ultralog-linux.tar.gz" "license.txt")
sha256sums=('SKIP' 'SKIP')

package() {
    tar -xzf "$srcdir/ultralog-linux.tar.gz" -C "$srcdir"
    install -Dm755 "$srcdir/ultralog-linux" "$pkgdir/usr/bin/ultralog"
}

