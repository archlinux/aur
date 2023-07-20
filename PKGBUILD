# Maintainer: Ayatale <ayatale@qq.com>

pkgname=xstop
pkgver=0.1.1
pkgrel=1
pkgdesc="Just click to pause/resume x11 windows, inspired by xkill."
url="https://github.com/Brx86/Xstop"
arch=("x86_64")
license=("GPL3")
depends=("libnotify" "procps-ng" "python" "xorg-xprop")
provides=("xstop")
source=("xstop")
sha256sums=('cd4f5c78ae660d9b93ce6d882c5d0bacb6babaf84867fc85053ac2a15f8e3416')

package() {
    install -Dm755 "xstop" -t "$pkgdir/usr/bin"
}
