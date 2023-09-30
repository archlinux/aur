# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
pkgname=share-preview-bin
_pkgname=share-preview
pkgver=0.4.0
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('x86_64')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
provides=('share-preview')
conflicts=('share-preview')
depends=('gtk4' 'libadwaita' 'glib2')
source=("$pkgname-$pkgver.tar.xz::https://github.com/rafaelmardojai/share-preview/releases/download/$pkgver/$_pkgname-$pkgver-bin.tar.xz")
sha256sums=('730c8183eeace31587955df6f1db35c78f787798b2cef901c3d8090b21fae367')

package() {
	cp -r "$srcdir/usr/" "$pkgdir/"
}
