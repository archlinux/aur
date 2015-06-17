# Maintainer: M0Rf30

pkgname=python2-cexio-api-git
pkgver=16.36976c0
pkgrel=1
pkgdesc="CEX.IO API integration. Python sources."
arch=(any)
url="https://github.com/matveyco/cex.io-api-python"
license=('MIT')
depends=('python2')
makedepends=('git')
source=(cexio::git+https://github.com/matveyco/cex.io-api-python.git)

package() {
  cd $srcdir/cexio
  install -D cexapi.py $pkgdir/usr/lib/python2.7/site-packages/cexapi.py
}

pkgver() {
  cd $srcdir/cexio
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
md5sums=('SKIP')
