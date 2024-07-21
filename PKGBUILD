# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=postman2openapi-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Convert a Postman collection to an OpenAPI definition, binary release"
provides=("postman2openapi")
arch=('x86_64')
url="https://github.com/kevinswiber/postman2openapi"
license=("Apache")

source=(
    "https://github.com/kevinswiber/postman2openapi/releases/download/${pkgver}/postman2openapi-${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)

sha256sums=(
    '98a67d01b550b22f9f20a14acd4948362367690ec92f5e79089ce2f6301b56b0'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/postman2openapi-${pkgver}-x86_64-unknown-linux-musl/postman2openapi" "${pkgdir}/usr/bin/postman2openapi"
}
