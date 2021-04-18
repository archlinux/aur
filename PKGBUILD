# Maintainer: Marcel Walk (Nyasaki) <mwalk at nyasaki dot cloud>

pkgname=add-gitignore
pkgver=1.1.1
pkgrel=2
pkgdesc="An interactive CLI tool that adds a .gitignore to your projects"
arch=('any')
url='https://www.npmjs.com/package/add-gitignore'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TejasQ/add-gitignore/archive/v${pkgver}.tar.gz")
sha256sums=('8269c0d37fe7f70353e40a678b25c8f58120af05e7a5cc7500aee383a1a78921')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
}