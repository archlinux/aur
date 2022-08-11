# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.7.9.50368
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python-nautilus')
options=(!strip)
source=("https://d2t3ff60b2tol4.cloudfront.net/builds/${pkgname}_${pkgver}_all.deb")
sha512sums=('d09496cd4c89fa36eb043d8eec5a51e1d71bab7a583c2e191e70de3ea42b96a4c3205c3cbbbf057829149b8da06a1cd0c5af25d3985ee6fa0458d3f8121d0b76')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
