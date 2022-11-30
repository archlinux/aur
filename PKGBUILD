# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.8.2.50468
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python-nautilus')
options=(!strip)
source=("https://cdn.insynchq.com/builds/linux/${pkgname}_${pkgver}_all.deb")
sha512sums=('720071450975500cc2cab79e9ee1d2103dbbc8572d3ae1f83aab5348282edd8cf29f8d171286319ccc412d9bc741f2256b51ea0d30f4123b9cf3c01d866bbc3e')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
