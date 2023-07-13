# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=tatsumato
pkgver=1.1
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
	"i3-wm: focus mpv when a break starts"
	"socat: pause and unpause mpv between pomodoros (+ requires 'wis/mpvSockets')"
	"i3lock: lock and unlock screen between pomodoros"
	"curl: control Anki's review screen via AnkiConnect"
	"dmenu: for interactivity (can use 'rofi' instead)"
)
source=(
	"tatsumato.sh"
)
sha256sums=('3e8d3ee5f0beac50f38dc805072aa8eee45eaedfbdbd38a79c235bf42f2b381e')
package() {
	install -D -m0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
