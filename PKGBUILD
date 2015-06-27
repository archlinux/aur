# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=rtee
pkgver=0.1.1
pkgrel=1
pkgdesc="Rotating tee"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jecxjo/rtee"
license=('BSD')
source=("https://commentedcode.org/pub/rtee/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('8b62617c3eb9b938a466be0af52d0c8ac5e6c582cef93e9334ca3a4f78b02d33'
            'SKIP')
validpgpkeys=('B6A6B4471912CA8D3FF60FE8636E38D422A69567')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

