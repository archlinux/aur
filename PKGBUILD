# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="A powerful extended cat command, to cat all the things you couldn't before"
arch=('x86_64' 'aarch64')
url="https://github.com/Skardyy/mcat"
license=('MIT')
depends=('gcc-libs')
provides=('mcat')
conflicts=('mcat')

source_x86_64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/Skardyy/mcat/releases/download/v$pkgver/mcat-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('70ca0166830ae0a41fb08de67e05722e037199cd691f9d3c0fa44f80eb51e088')
sha256sums_aarch64=('79c09dcd0ad34d48fc36742546d0d3dcb1770c25644268d642f94f9fede588ed')

package() {
    install -Dm755 "$srcdir/mcat-$CARCH-unknown-linux-gnu/mcat" "$pkgdir/usr/bin/mcat"
}
