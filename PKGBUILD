# Maintainer: Nguyễn Đình Quân <dinhquan at narga dot net>
# Supported Forum: http://forum.narga.org
pkgname=ttf-vietnamese-vni
pkgver=1.0
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Vietnamese Classic VNI Fonts"
arch=('any')
license=('EULA')
source=(https://dl.dropbox.com/s/knoq96vkfwcxtc4/$pkgname-$pkgver.tar.gz)
url="http://www.narga.org/2012/11/goi-cai-dat-cac-font-cu-tcvn3-va-vni-cho-arch-linux/"
install=$pkgname.install
md5sums=('89f6560ff1a533f14032aa2b9e21e918')

package()
{
	cd $pkgdir
	install -d -m 755 usr/share/fonts/TTF || return 1
	install -m 644 ${srcdir}/${_pkgname}/*.ttf usr/share/fonts/TTF || return 1

}


