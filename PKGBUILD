# Maintainer: Nguyễn Đình Quân <dinhquan at narga dot net>
# Supported Forum: http://forum.narga.org
pkgname=ttf-vietnamese-tcvn3
pkgver=1.0
pkgrel=3
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Vietnamese Classic TCVN3 Fonts"
arch=('any')
license=('EULA')
source=(https://dl.dropbox.com/s/pberbsx66oqgw0e/$pkgname-$pkgver.tar.gz)
url="http://www.narga.org/2012/11/goi-cai-dat-cac-font-cu-tcvn3-va-vni-cho-arch-linux/"
install=$pkgname.install
md5sums=('90541d4f333eb8abfc1747645cd1dcd9')

package()
{
	cd $pkgdir
	install -d -m 755 usr/share/fonts/TTF || return 1
	install -m 644 ${srcdir}/${_pkgname}/*.ttf usr/share/fonts/TTF || return 1

}


