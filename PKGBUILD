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
pkgver=1.6.1
pkgrel=1
pkgdesc='Full-stack JavaScript platform for developing modern web and mobile applications'
arch=(i686 x86_64)
url='https://www.meteor.com'
license=(MIT)
depends=(nodejs mongodb)
options=(!strip)
install=meteor.install
source_i686=(meteor-bootstrap-os.linux.$pkgver.i686.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz)
source_x86_64=(meteor-bootstrap-os.linux.$pkgver.x86_64.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz)
source=(meteor.sh
        meteor.install)
sha512sums_i686=(7a8ab0158deb889e13d44841433b37247b760be055383df48b84d017a7adc6d28620ce77b16f85f85fbca13385c27b87091b6201491d72c5c1d314f4ba1de06a)
sha512sums_x86_64=(a5f937d1019f8a98db1358966452a9ef77dbb48e8f038e362523a9950862d491f4cd80de94905d772c8d6dd0bae70db5e5ecca34e5217c0525c8fe352774a8bb)
sha512sums=(6322041c40be5740da446ee8c707cf611412aab1433a4726f08a7f8f7865224f21e59b0e0bf5d2b57871018d4eedef588fcbbab61df9a1c8ca95edbb91058275
            54ccc626d24f5f00502f4f0b38087f2979ae8a7907e5fd41ae8fb708052815a9bc381c9e525f9f41ee5fa9f34b9429e6c4d6f36030387e58b60d38488cf03eaa)

package() {
  install -d $pkgdir/usr/share
  cp -r $srcdir/.meteor $pkgdir/usr/share/meteor
  install -Dm 755 $srcdir/meteor.sh $pkgdir/usr/bin/meteor
}
