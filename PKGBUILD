# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('x86_64')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
provides=('share-preview')
conflicts=('share-preview')
depends=('gtk4' 'libadwaita' 'glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apandada1/share-preview/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cp -r "$srcdir/usr/" "$pkgdir/"
}
