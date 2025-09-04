# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=better-commits
pkgver=1.18.0
pkgrel=1
pkgdesc="A CLI for creating better commits following the conventional commit guidelines."
arch=(any)
url="https://github.com/Everduin94/better-commits"
license=('MIT')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
sha256sums=('fff8418cf9cf3156dee737fc48901cbdd1fd9acc75e047a6d57a4fe7a71936fd')
