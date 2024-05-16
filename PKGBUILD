# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=better-commits
pkgver=1.15.7
pkgrel=1
pkgdesc="A CLI for creating better commits following the conventional commit guidelines."
arch=(any)
url="https://github.com/Everduin94/better-commits"
license=('MIT')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('6ec4a3544d6498b0de616d36cfc6294373602549350c9f39b8142b68e64edc94')

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
