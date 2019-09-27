# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.0.20.40428
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python2-nautilus')
options=(!strip)
source=("https://d2t3ff60b2tol4.cloudfront.net/builds/${pkgname}_${pkgver}_all.deb")
sha512sums=('d5da3a685143dd07603ef26191b0a50ad1a2ea42bb8b6ff15cd8143479308a6b18577d1a5680a110592088831f48e920697ce0199d95a54120e7468a0fd6d927')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
