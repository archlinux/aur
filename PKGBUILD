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
sha256sums=('9d783876fdc82dd0fc06949d18452276c41652672b6e8927e0676e0641f125b3')
noextract=("homodoro-bin")

package() {
    install -Dm755 "homodoro-bin" "$pkgdir/usr/bin/homodoro"
}
