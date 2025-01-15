# Maintainer: César de la Rosa <cesardelarosasobrino@protonmail.com>
pkgname=antiwuolah
pkgver=1.2.0
pkgrel=1
pkgdesc="Script para eliminar páginas y anuncios de archivos PDF de Wuolah."
arch=('any')
url="https://github.com/cesardelarosa/antiWuolah"
license=('MIT')
depends=('qpdf' 'texlive-bin')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/cesardelarosa/antiWuolah/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://github.com/cesardelarosa/antiWuolah/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
	'd9ac7c8df0ad77ee477e7f6471a2c95b344ba45ab90643359e5207bfa7ca078b'
	'SKIP'
)

package() {
    install -Dm755 "$srcdir/antiWuolah-$pkgver/antiwuolah.sh" "$pkgdir/usr/bin/antiwuolah"
    install -Dm644 "$srcdir/antiWuolah-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/antiWuolah-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
