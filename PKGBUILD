# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=prosepoint
pkgver=0.32
pkgrel=1
pkgdesc="A free and open source newspaper content management system based on drupal."
arch=('i686' 'x86_64')
url="http://www.prosepoint.org/"
license=('GPL')
depends=('php')
install=('prosepoint.install')
backup=(srv/http/prosepoint/.htaccess)
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('fa0a4b76e53666fe5225a516c523cff3')

build() {
  mkdir -p $startdir/pkg/srv/http/prosepoint
  cp -r $startdir/src/$pkgname-$pkgver/{*,.htaccess} $startdir/pkg/srv/http/prosepoint
  echo "deny from all" > $startdir/pkg/srv/http/prosepoint/.htaccess
}
