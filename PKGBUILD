# Maintainer: Lukas Waymann <io@meribold.org>
pkgname=muccadoro
pkgver=1.0.0
pkgrel=1
arch=('any')

license=('Apache')

pkgdesc='Pomodoro timer using figlet, cowsay, and optionally lolcat'
url='https://github.com/meribold/muccadoro'
depends=(awk bash cowsay figlet libnotify coreutils ncurses)
optdepends=(lolcat)

source=("$pkgname-$pkgver.tar.gz::https://github.com/meribold/muccadoro/archive/v${pkgver}.tar.gz")
sha256sums=(74fdfb86883dc40d1ebcb4831a94e50dc89a629fd1e4662b4fab3f554855ce6d)

package() {
    cd "$pkgname-$pkgver" || return $?
    install -D muccadoro "$pkgdir/usr/bin/muccadoro"
}
