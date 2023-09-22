# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview-bin
_pkgname=share-preview
pkgver=0.3.0
pkgrel=2
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('x86_64')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
provides=('share-preview')
conflicts=('share-preview')
depends=('gtk4' 'libadwaita' 'glib2')
source=("$pkgname-$pkgver.tar.xz::https://github.com/rafaelmardojai/share-preview/releases/download/$pkgver/$_pkgname-$pkgver-bin.tar.xz")
sha256sums=('8b2eb00280011808aa54fe7fa76bb4f362c0361d4cb01b23d6c62fa843d0d24e')

package() {
	cp -r "$srcdir/usr/" "$pkgdir/"
}
