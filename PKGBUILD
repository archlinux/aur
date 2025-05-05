# Maintainer: Stanisław Badziak <stasbadzi@gmail.com>
pkgname=doas-keepenv
pkgver=1.0
pkgrel=1
pkgdesc="A shell script for running the doas command with keeping environment variables"
arch=(any)
url="https://github.com/stas-badzi/doas-keepenv"
license=('MIT')
makedepends=('coreutils')
depends=('coreutils' 'opendoas')
source=("https://github.com/stas-badzi/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aaf892d9b7a9775f4451bd1e1551dfb14b24dcdb2870bf6af4b524e0a421be27')

package() {
	mkdir -p $pkgdir/usr/bin
	install -m 755 "$pkgname-$pkgver/doas-keepenv" "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname"
}
