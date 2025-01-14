# Maintainer: César de la Rosa <cesardelarosasobrino@protonmail.com>
pkgname=antiwuolah
pkgver=1.0.0
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
sha256sums=('0ccb2dce3591a2ebfdf10dab161e361f2a916d74ba36ccba1f7b3d228d9c6a3f'
			'SKIP')

package() {
    install -Dm755 "$srcdir/antiWuolah-$pkgver/antiWuolah.sh" "$pkgdir/usr/bin/antiWuolah"
    install -Dm644 "$srcdir/antiWuolah-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/antiWuolah-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
