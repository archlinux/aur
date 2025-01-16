# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (pre-built binary)."
arch=('x86_64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu")
sha256sums=('b4b3be084bf94c07ee25530dc30258ba1f9d748c652dd73186d4315754457b29')

package() {
	cd "$srcdir"
	install -Dm755 getquotes-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/getquotes"
}
