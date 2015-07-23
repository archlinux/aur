# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=vamp-libxtract-plugins
pkgver=0.6.6.20121204
_downloadid=618
pkgrel=1
pkgdesc="Low-level feature extraction plugins using Jamie Bullock's libxtract library to provide around 50 spectral and other features"
arch=("i686" "x86_64")
url="https://code.soundsoftware.ac.uk/projects/vamp-libxtract-plugins"
license=("GPL2")
depends=("vamp-plugin-sdk" "libxtract-git")
source=("https://code.soundsoftware.ac.uk/attachments/download/$_downloadid/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 vamp-libxtract.so "$pkgdir/usr/lib/vamp/vamp-libxtract.so"
}

# vim:set ts=2 sw=2 et:
md5sums=('bc96f10c4d6c86b3fe2685331e9a3e7f')
