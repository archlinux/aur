pkgname=simple-and-soft-cursor
pkgver=2.0
pkgrel=1
pkgdesc='A simple and soft X cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.gz::https://github.com/red-magic/cursor-themes/releases/download/$pkgver/$pkgname.tar.gz)
b2sums=(4f61cc9111897c435074a9558b8f2358a1d5ce2cab8b5f9e958165b6d374f472ed15adbf6ea83b14044c4b9350aa7b717b8ecb9fa7b27d857ce4d7db8cfbe98c)

package() {
	install -Dm 644 $pkgname/cursors/* -t $pkgdir/usr/share/icons/$pkgname/cursors
	install -Dm 644 $pkgname/index.theme -t $pkgdir/usr/share/icons/$pkgname
}
