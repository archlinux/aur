# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.0.23.40579
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python2-nautilus')
options=(!strip)
source=("https://d2t3ff60b2tol4.cloudfront.net/builds/${pkgname}_${pkgver}_all.deb")
sha512sums=('7e4ff3638c5fc83951d487e3709e2fbf0d967184c6329b0b0dd68fe28c0f33f7b3c7f89442204a71bb519bfbcb1bcd77f04b4fc96f2c9fa6ed7e460ce3b7c1a1')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
