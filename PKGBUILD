# Maintainer: devome <evinedeng@hotmail.com>

pkgname=karakeep-cli
pkgver=0.33.1
pkgrel=1
pkgdesc="Command Line Interface (CLI) for Karakeep"
arch=("any")
url="https://www.npmjs.com/package/@karakeep/cli"
license=('AGPL-3.0-or-later')
provides=("hoarder-cli")
replaces=("hoarder-cli")
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@karakeep/cli/-/cli-${pkgver}.tgz")
sha256sums=('2fecaf6629923bdc26a98a5abf1e8a6d866432c3a08dd53de34f020c75472c53')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
