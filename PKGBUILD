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
sha256sums=('8d7bbfd9307087fb90ead36079106ffc7fdb35372f16819b4f6495caaa26e4e6')
package() {
	install -D -m0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
