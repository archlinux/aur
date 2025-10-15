# Maintainer: Leonardo Conrado <l.conrado10@gmail.com>

pkgname=homodoro-bin
pkgver=0.2.0.1
pkgrel=1
pkgdesc="Simple Pomodoro timer and task management TUI application written in Haskell with Brick"
arch=('x86_64')
url="https://github.com/c0nradLC/homodoro"
license=('GPL3')
depends=('libnotify' 'sdl2_mixer')
source=("homodoro-bin::$url/releases/download/v$pkgver/homodoro-bin")
sha256sums=('2a567c0d6f6fcf36cee22881f767f65cd155a63fdf3462496a7a554e1f357cc4')
noextract=("homodoro-bin")

package() {
    install -Dm755 "homodoro-bin" "$pkgdir/usr/bin/homodoro"
}
