# Maintainer: Wibo Kuipers <wibo@w-kuipers.com>
pkgname=alphadb-bin
pkgver=1.0.0_beta.42
pkgrel=1
pkgdesc="SQL Database Version Management"
arch=('x86_64')
url="https://alphadb.w-kuipers.com/"
license=('GPL-3.0-or-later')
provides=('alphadb')
conflicts=('alphadb')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/w-kuipers/alphadb/releases/download/v${pkgver//_beta./-beta.}/alphadb-cli_v${pkgver//_beta./-beta.}_Linux-x86_64.tar.gz")
sha256sums_x86_64=('2df1a56a3e38bc5924c7ea5fdf87e22e401ca4e71d637a6eb1987d93fba1abb1')

package() {
    install -Dm755 "${srcdir}/alphadb" "${pkgdir}/usr/bin/alphadb"
}
