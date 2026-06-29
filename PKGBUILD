# Maintainer: Wibo Kuipers <wibo@w-kuipers.com>
pkgname=alphadb-bin
pkgver=1.0.0_beta.50
pkgrel=1
pkgdesc="SQL Database Version Management"
arch=('x86_64')
url="https://alphadb.w-kuipers.com/"
license=('GPL-3.0-or-later')
provides=('alphadb')
conflicts=('alphadb')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/w-kuipers/alphadb/releases/download/v${pkgver//_beta./-beta.}/alphadb-cli_v${pkgver//_beta./-beta.}_Linux-x86_64.tar.gz")
sha256sums_x86_64=('012ac0f4daa5ff746e2ffe0bed4f16f362ffcf88a3a73e6b603041e1d510877c')

package() {
    install -Dm755 "${srcdir}/alphadb" "${pkgdir}/usr/bin/alphadb"
}
