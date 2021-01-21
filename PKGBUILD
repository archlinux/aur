# Maintainer: Jamie Quigley <jamie at quigley dot xyz>

pkgname=ultra-flat-icons-orange
pkgver=1.3.2
pkgrel=1
pkgdesc="Ultra Flat Icons - Orange Edition"
arch=('any')
url="http://www.noobslab.com/2015/01/make-linux-more-elegant-with-ultra-flat.html"
license=('CCPL')
depends=()
source=("https://launchpad.net/~noobslab/+archive/ubuntu/icons/+files/ultra-flat-icons-orange_$pkgver~trusty~Noobslab.com_all.deb")
sha1sums=('e6203f24aafb1bfa2980bf3d381218b574c45fdc')

package() {
	tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}"
}
