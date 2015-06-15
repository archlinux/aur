# Maintainer: Pierre DOUCET <pierre at equinoxefr.org>
pkgname=zygrib-maps
pkgver=2.4
pkgrel=3
pkgdesc="High resolution maps for zyGrib"
arch=('any')
url="http://www.zygrib.org/"
license=('GPL')
depends=('zygrib')
source=(zygrib_maps$pkgver.tgz::http://www.zygrib.org/getfile.php?file=zyGrib_maps$pkgver.tgz)
md5sums=('43324f8e8c7e9aa4e2f12dea4ae25d49')

build() {
   install -d -m 755 $pkgdir/opt/zygrib/data/maps/gshhs
   # README files already exist in package zygrib so we don't copy *
   install -m644 $srcdir/data/maps/gshhs/*.{rim,cat,cel,b} $pkgdir/opt/zygrib/data/maps/gshhs
}

