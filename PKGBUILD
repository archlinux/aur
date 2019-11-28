# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------
pkgname=xygrib-maps
pkgver=1.1.1
pkgrel=1
pkgdesc="High resolution maps for XyGrib, about 100Mb."
arch=('any')
url="https://opengribs.org/en/xygrib"
license=('GPL3')
depends=('xygrib')
source=('https://github.com/opengribs/XyGrib/releases/download/v1.1.1/XyGrib___High_Resolution_Maps.tar.gz')
sha1sums=('7849cd9361757ae89c48f0e74ce340c7faf15015')

package() {
   mkdir -p $pkgdir/usr/share/openGribs/XyGrib/data/maps/gshhs/
   # README already exists in this folder, and is provided by XyGrib
   install -m 644 $srcdir/data/data/maps/gshhs/*.{rim,cat,cel,b} $pkgdir/usr/share/openGribs/XyGrib/data/maps/gshhs/
  }
