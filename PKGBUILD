# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=better-commits
pkgver=1.10.0
pkgrel=1
pkgdesc="A CLI for creating better commits following the conventional commit guidelines."
arch=(any)
url="https://github.com/Everduin94/better-commits"
license=('MIT')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('e8efe80e0064f706ddd65e323208d15924751ee05fd61078ad7e4e4caf94c708')

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
