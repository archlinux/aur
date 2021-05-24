# Maintainer: Pyntux <pyntux@gmail.com>

pkgname=timerdown
pkgver=0.4.3
pkgrel=1
pkgdesc="A simple python & pyQT5 app to turn off your Linux PC in "X" minutes or "X" hours, or at specified time."
url="https://github.com/Pyntux/TimerDown"
arch=('any')
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("timerdown-git")
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')


package() {
    cd "${pkgname%-*}"
    make install DESTDIR="$pkgdir"
}
