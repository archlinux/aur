# Maintainer: Ayatale <ayatale@qq.com>

pkgname=xstop
pkgver=0.1.0
pkgrel=2
pkgdesc="Just click to pause/resume x11 windows, inspired by xkill."
url="https://github.com/Brx86/Xstop"
arch=("x86_64")
license=("GPL3")
depends=("python" "xorg-xprop" "procps-ng")
provides=("xstop")
source=("xstop")
sha256sums=('4c7ac97485fde73e6b5b4096bcae5f2b9da24e73bb20dcf71a0ab28d878ee76a')

package() {
    install -Dm755 "xstop" -t "$pkgdir/usr/bin"
}
