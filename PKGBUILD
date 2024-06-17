# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A CLI program that prints random words.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
conflicts=('wordgen')
provides=('wordgen')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/wordgen-v$pkgver-linux-amd64.tar.gz")
sha256sums=('a7e078d059a3a6185c59c174ea72b70f659ad60d6c75c32ae4571f7d58ae6795')

package() {
	cd "$srcdir"

	install -Dm755 "wordgen" "$pkgdir/usr/bin/wordgen"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wordgen/LICENSE"
}
