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

pkgname=meteor-js
pkgver=1.7.0.3
pkgrel=1
pkgdesc='Full-stack JavaScript platform for developing modern web and mobile applications'
arch=(i686 x86_64)
url=https://www.meteor.com
license=(MIT)
depends=(nodejs mongodb)
options=(!strip)
install=meteor.install
source_i686=(meteor-bootstrap-os.linux.$pkgver.i686.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz)
source_x86_64=(meteor-bootstrap-os.linux.$pkgver.x86_64.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz)
source=(meteor.sh
        meteor.install)
sha512sums_i686=(0a377c8fd7695f3284a75029618be342f81a971f380a6e15a1becedaf74ff1ae58f3e8f2931fcad0644ca2c250df11ae5578fb6a3a52be13e349b5c7a181484e)
sha512sums_x86_64=(1c90c4f418c3b0e597e70acfa639f6842644a566235db288922944d305310a0730c7359e7efe9f28034e30bfcd23a7e6304a7455cf76e7cb2a47b882d4491672)
sha512sums=(6322041c40be5740da446ee8c707cf611412aab1433a4726f08a7f8f7865224f21e59b0e0bf5d2b57871018d4eedef588fcbbab61df9a1c8ca95edbb91058275
            54ccc626d24f5f00502f4f0b38087f2979ae8a7907e5fd41ae8fb708052815a9bc381c9e525f9f41ee5fa9f34b9429e6c4d6f36030387e58b60d38488cf03eaa)

package() {
  install -d $pkgdir/usr/share
  cp -r $srcdir/.meteor $pkgdir/usr/share/meteor
  install -Dm 755 $srcdir/meteor.sh $pkgdir/usr/bin/meteor
}
