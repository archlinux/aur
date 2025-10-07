# Maintainer: Leonardo Conrado <l.conrado10@gmail.com>

pkgname=homodoro-bin
pkgver=0.2.0.0
pkgrel=1
pkgdesc="Simple Pomodoro timer and task management TUI application written in Haskell with Brick"
arch=('x86_64')
url="https://github.com/c0nradLC/homodoro"
license=('GPL3')
depends=('libnotify' 'sdl2_mixer')
source=("homodoro-bin::$url/releases/download/v$pkgver/homodoro-bin")
sha256sums=('6573c7f80dbf0618b73f67caaf2d7ab6b975ea6aa34b3568de13a772de81cb47')
noextract=("homodoro-bin")

package() {
    install -Dm755 "homodoro-bin" "$pkgdir/usr/bin/homodoro"
}
