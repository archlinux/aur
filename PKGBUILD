# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.2.7
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (pre-built binary)."
arch=('x86_64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source=(
	"https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu"
	"https://raw.githubusercontent.com/MuntasirSZN/getquotes/refs/heads/main/LICENSE"
	"https://raw.githubusercontent.com/MuntasirSZN/getquotes/refs/heads/main/man/getquotes.1"
)
sha256sums=('027f3ec17620ef8e68fd2a4314f5783fc728bc58a5e8d213f634b90860917e81'
	'87f2cb73fde60ac0cfb5f572dd813a1199d542400e0e256299be5c51e3ca910f'
	'863c1f303344aa3c6abe2af1a3968e5d811d3b646d65e68ac185f10511daa63a')

package() {
	cd "$srcdir"
	install -Dm755 getquotes-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/getquotes"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "getquotes.1" "$pkgdir/usr/share/man/man1/getquotes.1"
}
