# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=tatsumato
pkgver=1.4
pkgrel=1
pkgdesc="Tatsumoto's Pomodoro timer written in Bash"
arch=('any')
url="https://tatsumoto.neocities.org/blog/timeboxing"
license=('GPL3')
depends=(
	"bash"
	"util-linux"
	"sound-theme-freedesktop"
	"libpulse"
	"libnotify"
)
optdepends=(
	"i3-wm: focus windows, e.g. focus mpv when a break starts"
	"socat: pause and unpause mpv between pomodoros (+ requires 'wis/mpvSockets')"
	"i3lock: lock and unlock screen between pomodoros"
	"curl: control Anki's review screen via AnkiConnect"
	"dmenu: for interactivity (can use 'rofi' instead)"
)
source=(
	"tatsumato.sh"
)
sha256sums=('85a0d1d0d3fdd03ad5d8f93e16bdc01e278a2847397ee6d0339de85d9d332ae0')
package() {
	install -D -m0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
