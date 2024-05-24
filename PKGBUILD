# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=tatsumato
pkgver=1.3
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
sha256sums=('b8955c5d09eba9979b9e126b256f772b0f3517c807b0d6d4092e2bfd5bd545c2')
package() {
	install -D -m0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
