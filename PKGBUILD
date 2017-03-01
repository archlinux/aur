# Maintainer: Brainfuck
# http://github.com/brainfucksec

pkgname=archtorify
pkgver=1.8.1
pkgrel=1
pkgdesc="Program for simplify the configuration of transparent proxy trough Tor Network"
arch=('any')
url="https://github.com/brainfucksec/archtorify/"
license=('GPL3')
depends=('tor>=0.2.9' 'curl')
md5sums=('SKIP')
source=("https://github.com/brainfucksec/archtorify")

package() {
	cd "$pkgname"

	mkdir -p "$pkgdir/usr/share/$pkgname"
	
	install -Dm644 "README.md" "$pkgdir/usr/share/$pkgname/README.md"
	install -Dm755 "archtorify.sh" "$pkgdir/usr/bin/archtorify"

}

# vim:set ts=2 sw=2 et:
