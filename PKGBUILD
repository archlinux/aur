# Maintainer: Caleb Woodbine <gitlab.com/BobyMCbobs>
pkgname=idle-python3.7-assets
pkgver=1.0
pkgrel=1
pkgdesc="Python's Intergrated Development and Learning Environment"
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('python' 'python2')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('033bfaefcc566577cf8a6f5e173f3c01')

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
