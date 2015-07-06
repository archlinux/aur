# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=managingnews
pkgrealname=
pkgver=1.2
pkgrealver=1.2
pkgrel=1
pkgdesc="Managing News is a robust news and data aggregation engine based on drupal"
arch=('i686' 'x86_64')
url="http://www.managingnews.com/"
license=('GPL')
depends=('php')
install=('managingnews.install')
backup=(srv/http/managingnews/.htaccess)
source=(http://managingnews.com/files/$pkgname-$pkgrealver.zip)
md5sums=('62842e781d79f7e692cb9f42bda08778')

build() {
  mkdir -p $startdir/pkg/srv/http/managingnews
  cp -r $startdir/src/$pkgname-$pkgrealver/{*,.htaccess} $startdir/pkg/srv/http/managingnews
  echo "deny from all" > $startdir/pkg/srv/http/managingnews/.htaccess
}
