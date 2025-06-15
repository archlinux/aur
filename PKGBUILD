# Maintainer: devome <evinedeng@hotmail.com>

pkgname=karakeep-cli
pkgver=0.25.0
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
sha256sums=('4c704bef1be48cdbf85a76ab051ca4757e09499887b60032af22edc359ebf414')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
