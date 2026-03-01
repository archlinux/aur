# Maintainer: mineleng <15119587808@163.com>
pkgname=apmw
pkgver=1.0
pkgrel=4
pkgdesc="Apt-PacMan Warpper - 一个将apt风格命令转换为pacman命令的包装器"
arch=('any')
license=('MIT')
depends=('pacman')
makedepends=('gcc')
source=("https://gitee.com/mineleng/apmw/archive/refs/tags/1.0.tar.gz")
sha256sums=('64120156fbdbdb70f8488153dc7c444061bfc7fe79b77ebeda40730aaaab65ef')
build() {
    cd "apmw-1.0"
    gcc -o apmw apmw.c
}

package() {
    cd "apmw-1.0"
    install -Dm755 apmw -t "$pkgdir/usr/bin/"
}
