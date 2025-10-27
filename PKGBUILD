# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.4.4
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

sha256sums_x86_64=('1717be3f120f93a4f2441778d3733e014b65b5c95f20191e26df96397ea053ce')
sha256sums_aarch64=('1a826e43231d661df971773124de96f84a5a6a264fbf910dad0541aa34f9acc8')

package() {
    install -Dm755 "$srcdir/mcat-$CARCH-unknown-linux-gnu/mcat" "$pkgdir/usr/bin/mcat"
}
