# Maintainer: devome <evinedeng@hotmail.com>

pkgname=karakeep-cli
pkgver=0.27.0
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
sha256sums=('9eced98d0ddad05633040e51dd786b44463065758b7ff1d0fb94dfc386dda41a')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
