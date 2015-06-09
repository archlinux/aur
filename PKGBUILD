# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=gimp-plugin-webp
pkgver=0.1.1
pkgrel=2
pkgdesc="Gimp plugin to load and save files using the new WebP image format."
arch=('i686' 'x86_64')
url="http://registry.gimp.org/node/25874"
license=('GPL-3.0')
depends=(gimp libwebp)
source=(http://registry.gimp.org/files/gimp-webp_0.1.1.tar.gz)
sha1sums=('eee1f32408e84f863de9722202b4be6a2e53a43a')

build() {
    cd "$srcdir/gimp-webp_$pkgver"
    make
}

package() {
    cd "$srcdir/gimp-webp_$pkgver"
    make DESTDIR="$pkgdir/usr" install
}
