# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.9.5.60024
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python-nautilus')
options=(!strip)
source=("https://cdn.insynchq.com/builds/linux/${pkgver}/${pkgname}_${pkgver}_all.deb")
sha512sums=('32896bea763ddaede447da424ede7a901faca49499088ddc75bf1e7ecd5c3d1d23d24e56a14b51f03edadd576e1371f39c04770831139bf12a7ea96dad94f264')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
