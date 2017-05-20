# Maintainer: Jean Lucas <jean@4ray.co>
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
pkgver=1.4.4.3
pkgrel=1
pkgdesc="Full-stack JavaScript platform for developing modern web and mobile applications"
arch=('i686' 'x86_64')
url="https://www.meteor.com"
license=('MIT')
depends=('nodejs' 'mongodb')
source=(meteor)
sha256sums=('68b1a97b86292389e36f18ed9b5af98d8018b3d1fc83d58b86b6ec10c31d4641')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm 0755 "${srcdir}/meteor" "${pkgdir}/usr/bin/meteor"
}
