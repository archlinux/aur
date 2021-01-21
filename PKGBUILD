# Maintainer: Jamie Quigley <jamie at quigley dot xyz>

pkgname=ultra-flat-icons-green
pkgver=1.3.2
pkgrel=1
pkgdesc="Ultra Flat Icons - Green Edition"
arch=('any')
url="http://www.noobslab.com/2015/01/make-linux-more-elegant-with-ultra-flat.html"
license=('CCPL')
depends=()
source=("https://launchpad.net/~noobslab/+archive/ubuntu/icons/+files/ultra-flat-icons-green_$pkgver~trusty~Noobslab.com_all.deb")
sha1sums=('9ef68e2e99e5421345c30b1360965d5878270f10')

package() {
	tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"
}
