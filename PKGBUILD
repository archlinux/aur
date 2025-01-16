# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.1.0
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
sha256sums=(
	'b4b3be084bf94c07ee25530dc30258ba1f9d748c652dd73186d4315754457b29'
	'87f2cb73fde60ac0cfb5f572dd813a1199d542400e0e256299be5c51e3ca910f'
	'f06280ea00ff505eafdc7eb77d9e0719875348463a604d882884efc278f98c0d'
)

package() {
	cd "$srcdir"
	install -Dm755 getquotes-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/getquotes"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "getquotes.1" "$pkgdir/usr/share/man/man1/getquotes.1"
}
