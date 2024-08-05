# Maintainer: Rich Lees <git0 at bitservices dot io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: theguy147 <yakamoz147 (at) protonmail (dot) com>

pkgname=libobjectbox
pkgver=0.21.0
pkgrel=1
pkgdesc='C/C++ database for objects and structs'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/objectbox/objectbox-c"
license=('Apache' 'custom')
depends=('gcc-libs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-armv7hf.tar.gz")
sha256sums_x86_64=('334962788af54b0a3c8dff47f6be56a7ab544292a776be36b337f46173a929a2')
sha256sums_aarch64=('9bcebd50adfe10ea0e42e4df84c73e9d1a4c70a1a44f41f261ee1d81c7278d44')
sha256sums_armv7h=('bef62ebca976aa242c7245d3de809808cbd404033335e221f0eb469ac312d834')

package() {
    install -Dm644 "${srcdir}/lib/${pkgname}.so" "${pkgdir}/usr/lib/${pkgname}.so"
}
