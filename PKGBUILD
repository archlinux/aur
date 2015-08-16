# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=srt-delay
pkgver=0.0.3
pkgrel=1
pkgdesc="A commandline tool to adjust srt's time stamp."
arch=('any')
url="http://code.google.com/p/trizen/downloads/detail?name=$pkgname-$pkgver.tar.gz"
license=('GPL')
depends=('perl>=5.10.1')
source=("http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('61417d74fa64e394e69124d133c0bf6b')

package() {
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
