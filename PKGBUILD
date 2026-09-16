# Maintainer: mineleng <15119587808@163.com>
pkgname=apmw
pkgver=1.0.0
pkgrel=4
pkgdesc="Apt-PacMan Warpper - 一个将apt风格命令转换为pacman命令的包装器"
arch=('any')
license=('MIT')
depends=('pacman')
makedepends=('gcc')
source=("https://github.com/mcmineleng/apmw/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('6e6ac1f931e7f2e77816ec8ce1d17318e15f92da3f9e2a5e7f7f0f4f91eac902')
build() {
    cd "apmw-1.0.0"
    gcc -o apmw apmw.c
}

package() {
    cd "apmw-1.0.0"
    install -Dm755 apmw -t "$pkgdir/usr/bin/"
}
