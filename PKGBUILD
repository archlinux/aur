# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.0.25.40643
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python-nautilus')
options=(!strip)
source=("https://d2t3ff60b2tol4.cloudfront.net/builds/${pkgname}_${pkgver}_all.deb")
sha512sums=('07ddc4aeed3c703b5f7a5d627c1aad75ee073f8fa169a1bd064361c9e34dfc040857268ef19867ac9ef2b4f3d57a1bad25afdbe5fb32d057e49d1e624424c9ea')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
