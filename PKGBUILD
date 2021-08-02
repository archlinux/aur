# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-runit
pkgver=20210802
pkgrel=1
pkgdesc="g15stats init script for runit"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15stats' 'runit')
_filename='g15stats.run'
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.run")
sha256sums=('44f2ed8416a75fd3f2299eb682d93c52c9833af7a7c0906660114d1dd3987834')

package() {
   install -Dm755 "$srcdir/g15stats.run" "$pkgdir/etc/runit/sv/g15stats/run"
}

