# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=nodejs-fontmin
_pkgname=${pkgname#nodejs-}
pkgver=2.0.0
pkgrel=2
pkgdesc="Font converter/Optimizer"
url="https://github.com/ecomfe/fontmin"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'nodejs' 'python' 'python-setuptools')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ecomfe/fontmin/archive/v${pkgver}.tar.gz")
sha256sums=('6a444c077f7aaec190887e7acccd00d9cd77a7e089fa1578d3a573798a828087')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
}
