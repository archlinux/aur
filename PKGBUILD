# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=anew
pkgname=anew-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool for adding new lines to files, skipping duplicates"
arch=(x86_64)
url="https://github.com/tomnomnom/anew"
license=(MIT)
provides=(anew)
conflicts=(anew)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-$pkgver.tgz")
b2sums=(SKIP)
package() {
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
}
