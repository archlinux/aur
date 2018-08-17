# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Robert Booster <boosterdev@linuxmail.org>
# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>
# Contributor: Kamil Śliwak <cameel2 gmail>

pkgname=meteor
pkgver=1.7.0.4
pkgrel=1
pkgdesc='Full-stack JavaScript platform for developing modern web and mobile applications'
arch=(i686 x86_64)
url=https://www.meteor.com
license=(MIT)
depends=(nodejs mongodb)
options=(!strip)
install=meteor.install
source=(meteor.sh)
source_i686=(meteor-bootstrap-os.linux.$pkgver.i686.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz)
source_x86_64=(meteor-bootstrap-os.linux.$pkgver.x86_64.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz)
sha512sums=('739ff7cb9eed1b919335851f0b1b62d21655b046cdbec83a1c8fd7aae83f8044dd39caeec855c8baafc2caf68c5ab986d7d96a98732adeaa90fdffa118a4b393')
sha512sums_i686=('7f1e9551004919975090d895cbf1fbce7030199dbde3853d64d921a62fbfeb21b8a848ae774e5f55b9b47d6b25428d1cb9b015a1d230161b95e420cb013c45e3')
sha512sums_x86_64=('589b09e03d96164192dc7f4517b301fa8eec490446f03611422f72e0cfd865d1213d2df105ee1aaff8133201dc21dd8c80ded3a5ad3d0965d8e68f9031d60b34')

package() {
  install -d "$pkgdir"/usr/share
  cp -a .meteor "$pkgdir"/usr/share/meteor
  install -D meteor.sh "$pkgdir"/usr/bin/meteor
}
