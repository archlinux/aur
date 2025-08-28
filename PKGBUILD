# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=http-server-upload
pkgver=3.0.0
pkgrel=3
pkgdesc="Zero-configuration command-line http server which provides a lightweight interface to upload files"
arch=('any')
url="https://github.com/crycode-de/http-server-upload"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crycode-de/http-server-upload/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('b146145ba8aaec88c6a933fb02202fefbe95458daed5fcd36ba51d42b4e00c7e')

package() {
	npm install -g --prefix "${pkgdir}"/usr "${srcdir}"/${pkgname}-${pkgver}.tar.gz
}
