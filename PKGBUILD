# Maintainer: devome <evinedeng@hotmail.com>

pkgname=karakeep-cli
pkgver=0.23.0
pkgrel=1
pkgdesc="Command Line Interface (CLI) for Karakeep"
arch=("any")
url="https://github.com/karakeep-app/karakeep"
license=('AGPL-3.0-or-later')
provides=("hoarder-cli")
replaces=("hoarder-cli")
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@karakeep/cli/-/cli-${pkgver}.tgz")
sha256sums=('4712a9dfcb27aff2611f6d629e158cdf380cfd4b1eb28b9766a46e2c3b39fba4')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
