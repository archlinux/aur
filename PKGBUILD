# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=3.7.11.50381
pkgrel=1
pkgdesc="Python extension and icons for integrating Insync with Nautilus"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python-nautilus')
options=(!strip)
source=("https://cdn.insynchq.com/builds/linux/${pkgname}_${pkgver}_all.deb")
sha512sums=('acce7f211ccb1aaf9b03db49ad1af5b554e1d95c7b21bf347873c69ff39cb85b91bbf7535e5d0a86c25303bf8f564faa87c32b4e10416faf1d3bddbf2da8c785')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
