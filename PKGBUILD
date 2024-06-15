# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview-bin
_pkgname=share-preview
pkgver=0.5.0
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('x86_64')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
provides=('share-preview')
conflicts=('share-preview')
depends=('gtk4' 'libadwaita' 'glib2')
source=("$pkgname-$pkgver.tar.xz::https://github.com/rafaelmardojai/share-preview/releases/download/$pkgver/$_pkgname-$pkgver-bin.tar.xz")
sha256sums=('3b2c693127c9038cc29cec119cfa541aab7f1133fc7c9b039229d5d1e9751755')

package() {
	cp -r "$srcdir/usr/" "$pkgdir/"
}
