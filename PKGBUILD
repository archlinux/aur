# Maintainer: Leonardo Conrado <l.conrado10@gmail.com>

pkgname=homodoro-bin
pkgver=0.2.1.0
pkgrel=1
pkgdesc="Simple Pomodoro timer and task management TUI application written in Haskell with Brick"
arch=('x86_64')
url="https://github.com/c0nradLC/homodoro"
license=('GPL3')
depends=('sdl2_mixer')
source=("homodoro::$url/releases/download/v$pkgver/homodoro")
sha256sums=('5ea3954455c27bc72b4c985533ed82a312f8a267771940fe590ce68ab8b24e0f')
noextract=("homodoro")

package() {
    install -Dm755 "homodoro" "$pkgdir/usr/bin/homodoro"
}
