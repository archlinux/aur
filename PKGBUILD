# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
conflicts=('wordgen')
provides=('wordgen')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/wordgen-v$pkgver-linux-amd64.tar.gz")
sha256sums=('e11e8bb3dafafa02b98156d2aeca0f24a6ed538d06ddda6d1b2e49726bc57309')

package() {
	cd "$srcdir/wordgen-v$pkgver-linux-amd64"

	install -Dm755 "wordgen" "$pkgdir/usr/bin/wordgen"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wordgen/LICENSE"
}
