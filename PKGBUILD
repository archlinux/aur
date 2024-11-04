# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=nodejs-fontmin
_pkgname=${pkgname#nodejs-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Font converter/Optimizer"
url="https://github.com/ecomfe/fontmin"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'nodejs' 'python' 'python-setuptools')
makedepends=('npm')
#noextract=("${_pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('686e5ae896b73125e56605e800accb59f03a9f2ba5523398cb3244f144952949')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
