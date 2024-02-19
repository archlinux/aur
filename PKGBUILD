# Maintainer: Martin Rys <rys.pw/contact>

pkgname=http-server-upload
pkgver=3.0.0
pkgrel=2
epoch=
pkgdesc="Zero-configuration command-line http server which provides a lightweight interface to upload files."
arch=('any')
url="https://github.com/crycode-de/http-server-upload"
license=('MIT')
groups=()
depends=('nodejs')
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('35d335f54020bb9dfe70489e4d90e6904b22435728467176c28978f6e4a0f02c')
validpgpkeys=()

package() {
	npm install -g --prefix "${pkgdir}"/usr "${srcdir}"/${pkgname}-${pkgver}.tgz
}
