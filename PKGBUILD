# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=mopidy-autoplay
pkgver=0.2.3
pkgrel=2
pkgdesc="Mopidy extension to automatically pick up where you left off and start playing the last track from the position before Mopidy was shut down."
arch=('any')
url="https://codeberg.org/sph/mopidy-autoplay/"
license=('APACHE')
depends=(
  'mopidy>=3'
  python-pykka
  python-setuptools
)
source=(
  "$pkgname-$pkgver.tar.gz::https://codeberg.org/sph/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('a85f2d2937dd6b64f51aa940ee23d665f07f925159c98384a532f4cfbad236f7')

package() {
  cd "$srcdir/$pkgname"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
