# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=nodejs-fontmin
_pkgname=${pkgname#nodejs-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Font converter/Optimizer"
url="https://github.com/ecomfe/fontmin"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'nodejs' 'python' 'python-setuptools')
makedepends=('npm')
#noextract=("${_pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('662cfbd757ddf63a6e712242cd6a0839d1e347198557d4946691608056da0e74')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
