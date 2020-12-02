# Maintainer: Lukas Waymann <io@meribold.org>
pkgname=muccadoro
pkgver=1.0.1
pkgrel=1
arch=('any')

license=('Apache')

pkgdesc='Pomodoro timer using figlet, cowsay, and optionally lolcat'
url='https://github.com/meribold/muccadoro'
depends=(awk bash cowsay figlet libnotify coreutils ncurses)
optdepends=(lolcat)

source=("$pkgname-$pkgver.tar.gz::https://github.com/meribold/muccadoro/archive/v${pkgver}.tar.gz")
sha256sums=(1e881ab91a8f0f3e9d3e99427f4cf9f2c4023a78cc6ac5f5df6e2479ce71fb4b)

package() {
    cd "$pkgname-$pkgver" || return $?
    install -D muccadoro "$pkgdir/usr/bin/muccadoro"
}
