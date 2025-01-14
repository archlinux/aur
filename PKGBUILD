# Maintainer: César de la Rosa <cesardelarosasobrino@protonmail.com>
pkgname=antiwuolah
pkgver=1.1.1
pkgrel=1
pkgdesc="Script para eliminar páginas y anuncios de archivos PDF de Wuolah."
arch=('any')
url="https://github.com/cesardelarosa/antiWuolah"
license=('MIT')
depends=('qpdf' 'texlive-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cesardelarosa/antiWuolah/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d430e257334a3a3c829e991ba9c71ca82a844c3b677d6d6ecb7b0a9d98eda30')

package() {
    install -Dm755 "$srcdir/antiWuolah-$pkgver/antiwuolah.sh" "$pkgdir/usr/bin/antiwuolah"
    install -Dm644 "$srcdir/antiWuolah-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/antiWuolah-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
