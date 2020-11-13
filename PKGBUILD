# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=sqlc-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Generate type safe Go from SQL'
arch=('x86_64')
url="https://github.com/kyleconroy/sqlc"
license=('MIT')
source=("https://github.com/kyleconroy/sqlc/releases/download/v${pkgver}/sqlc-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('ce9cb631489b81fa979bec0de93506eb894c65e03694173478a158c4d7115a7e')

package() {
    install -Dm755 "${srcdir}/sqlc" "${pkgdir}/usr/bin/sqlc"
}

