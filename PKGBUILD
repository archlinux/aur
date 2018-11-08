# Maintainer: fenuks

pkgname=vue-language-server
pkgver=0.0.35
pkgrel=1
pkgdesc="Language server protocol implementation for Vue"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://www.npmjs.com/package/${pkgname}"
license=('MIT')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-$pkgver.tgz")
noextract=(${pkgname}-$pkgver.tgz)
sha256sums=('fa002e5012ca12296f04226aefe25c3538a00ca2c0128e277adb45c694465c8f')
options=('!emptydirs')
provides=('vue-language-server')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"

}
