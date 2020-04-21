# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.1.4.40795
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python-nautilus')
options=(!strip)
source=("https://d2t3ff60b2tol4.cloudfront.net/builds/${pkgname}_${pkgver}_all.deb")
sha512sums=('7dd647d2047a1333e2d8d9a56c58a7c19481121fa0f20d4dc57ef9800635a8a8f7aa0db4df794596080d13ca4e6a9b58a08142e515ec6f85eaf651807f864f98')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
