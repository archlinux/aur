# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nautilus
pkgver=1.3.12.36116
pkgrel=2
pkgdesc="Nautilus integration for insync"
arch=('any')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=('insync' 'nautilus' 'python2-nautilus')
options=(!strip)
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-precise_all.deb")
sha512sums=('0fcebd11082f26caa98f19bb491b8eb958f98893f306d25b735621123037612bb33264d2118851815096eaa4adca9c53a8f5f3e3e010b0ecec7b6d2f021a97b3')

prepare() {
	tar xvf data.tar.gz
}

package() {
	cp -dpr --no-preserve=ownership usr "${pkgdir}"
}
