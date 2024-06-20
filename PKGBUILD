# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder-cli
pkgver=0.13.5
pkgrel=1
pkgdesc="Command Line Interface (CLI) for Hoarder"
arch=("any")
url="https://github.com/hoarder-app/hoarder"
license=('AGPL-3.0-or-later')
depends=("nodejs")
makedepends=("npm")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "@hoarderapp/cli@${pkgver}"
}
