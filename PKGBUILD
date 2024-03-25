# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=better-commits
pkgver=1.14.0
pkgrel=1
pkgdesc="A CLI for creating better commits following the conventional commit guidelines."
arch=(any)
url="https://github.com/Everduin94/better-commits"
license=('MIT')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('861d774e50d6e98c4750efbe597d820150438269b8f9e28c065673f3e0f2bfb8')

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
