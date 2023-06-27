# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=tatsumato
pkgver=1.0
pkgrel=1
pkgdesc="Tatsumoto's Pomodoro timer written in Bash"
arch=('any')
url="https://tatsumoto.neocities.org/blog/table-of-contents"
license=('GPL3')
depends=(
	"bash"
	"util-linux"
	"sound-theme-freedesktop"
	"libpulse"
	"libnotify"
)
optdepends=(
	"i3-wm: focus mpv when a break starts"
	"socat: pause and unpause mpv between pomodoros (+ requires 'wis/mpvSockets')"
	"i3lock: lock and unlock screen between pomodoros"
	"curl: control Anki's review screen via AnkiConnect"
	"dmenu: for interactivity (can use 'rofi' instead)"
)
source=(
	"tatsumato.sh"
)
sha256sums=('7c3bf3995e48deff5a9e97f609e02fd5f87ea88987166bcf06af715a358e57df')
package() {
	install -D -m0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
