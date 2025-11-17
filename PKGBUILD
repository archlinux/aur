# Maintainer: Meron Bossin Meronbssn@gmail.com
pkgname=mcat-bin
pkgver=0.4.6
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

sha256sums_x86_64=('a572b5f2d790634840755ed3d876aa71711bb94ee2a268298e09c701495edd14')
sha256sums_aarch64=('7e0ad88279e7c7baf1ce2997ff270daac25081fdd89e14fb78d0d77f11b56190')

package() {
    install -Dm755 "$srcdir/mcat-$CARCH-unknown-linux-gnu/mcat" "$pkgdir/usr/bin/mcat"
}
