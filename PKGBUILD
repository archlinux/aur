# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview-bin
_pkgname=share-preview
pkgver=0.2.0
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('x86_64')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
provides=('share-preview')
conflicts=('share-preview')
depends=('gtk4' 'libadwaita' 'glib2')
source=("$pkgname-$pkgver.tar.xz::https://github.com/rafaelmardojai/share-preview/releases/download/$pkgver/$_pkgname-$pkgver-bin.tar.xz")
sha256sums=('7703ddec92cebbfbdd29880572189ab85f8412880d9ca751ec8f9dc998da5b10')

package() {
	cp -r "$srcdir/$_pkgname-$pkgver-bin/usr/" "$pkgdir/"
}
