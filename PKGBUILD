pkgname=roomjuice
pkgver=0.3.4
pkgrel=1
pkgdesc="A multi-user jukebox web application. You can stream the music to other people as well."
url="http://grecni.com/roomjuice/"
arch=(any)   
optdepends=(apache)
depends=(taginfo php mlocate )
source=("http://grecni.com/$pkgname/dl/$pkgname-$pkgver.tar.bz2")
license=('GPL2')

build() {
   
  cd $srcdir/
  mkdir -p $pkgdir/srv/http/$pkgname
  cp -r $pkgname*/* /$pkgdir/srv/http/$pkgname
}

md5sums=('63ffa98e28b418d1713282215206a6a7')
