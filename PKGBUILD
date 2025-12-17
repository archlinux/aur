# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=better-commits
pkgver=1.18.1
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
sha256sums=('fb145cb9eebf36a82b7a1d4650bd3929d8f39d6ff98b3f73ae229eb91f4e724f')
