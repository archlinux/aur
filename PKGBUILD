# Maintainer: devome <evinedeng@hotmail.com>

pkgname=karakeep-cli
pkgver=0.33.2
pkgrel=1
pkgdesc="Command Line Interface (CLI) for Karakeep"
arch=("any")
url="https://www.npmjs.com/package/@karakeep/cli"
license=('AGPL-3.0-or-later')
provides=("hoarder-cli")
replaces=("hoarder-cli")
makedepends=("npm")
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@karakeep/cli/-/cli-${pkgver}.tgz")
sha256sums=('ec8981153d3348f5b5553141494b37f5d967ba207eafb050affaa6b15d0d0e5c')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    depends=("nodejs")
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
