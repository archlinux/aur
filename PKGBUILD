# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=lpaq
pkgver=8
pkgrel=1
pkgdesc="Lite version of PAQ; faster single file compressor but with less compression"
arch=(i686 x86_64)
url=http://www.cs.fit.edu/~mmahoney/compression/#$pkgname
license=(GPL3)
makedepends=(nasm)
source=(http://www.cs.fit.edu/~mmahoney/compression/$pkgname$pkgver.zip)
sha256sums=('ea43474526f13338cbb50ce3fbd974a0d088d77a3b73d42010ad11fb89a498b2')
sha512sums=('c93c2c2d4fc98b2d18939f4578b795c7ed019086cdec4ebf87f5840c2ba12c15155881f56481e06dfa96953c17d892bace61d09ac2ac934c3f55220660c14e04')

build() {
    g++ -Wall $pkgname$pkgver.cpp $CFLAGS -o $pkgname$pkgver
}

package() {
    install -Dm755 $pkgname$pkgver "$pkgdir"/usr/bin/$pkgname$pkgver
}
