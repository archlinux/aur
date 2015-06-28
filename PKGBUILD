# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=minmix
pkgver=0.3
pkgrel=1
pkgdesc="A small OSS mixer."
arch=('i686' 'x86_64')
license=('custom:BSD')
optdepends=('oss: sound mixing')
url="http://litcave.rudi.ir"
source=("http://litcave.rudi.ir/$pkgname-$pkgver.tar.gz")
md5sums=('df1f654bf8864c75a5ca1e48803f57a2')
sha1sums=('f9b966d2d2faed31dac6f3b6ebbf6e5700358ceb')
sha256sums=('3b84d3f5421fa003883c5773fc8589e4998ca8422434e1d01ca9d5eec8b7f3ee')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

