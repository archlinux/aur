# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder-cli
pkgver=0.13.7
pkgrel=1
pkgdesc="Command Line Interface (CLI) for Hoarder"
arch=("any")
url="https://github.com/hoarder-app/hoarder"
license=('AGPL-3.0-or-later')
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@hoarderapp/cli/-/cli-${pkgver}.tgz")
sha256sums=('e55ab8fcd8083472d09970fb8bed52c5e7cb75bbdada10c3041fdc87360194dd')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
