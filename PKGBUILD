# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=http-server-upload
pkgver=3.1.0
pkgrel=1
pkgdesc="Zero-configuration command-line http server which provides a lightweight interface to upload files"
arch=('any')
url="https://github.com/crycode-de/http-server-upload"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crycode-de/http-server-upload/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('1e47f2dd58182ca2e20d78d72e9c521fd5be119669b61906e7e4e5730f78023a')

package() {
	npm install -g --prefix "${pkgdir}"/usr "${srcdir}"/${pkgname}-${pkgver}.tar.gz
}
