# Maintainer: Thomas Le Duc <dev@tleduc.de>

pkgname=rn-bin
pkgver=0.1.0
pkgrel=2
pkgdesc='Rename files and directories.'
arch=('x86_64')
url='https://github.com/thled/rn'
license=('MIT')
depends=('gcc-libs')
provides=('rn')
conflicts=('rn')
changelog=CHANGELOG.md
source=("$url/releases/download/v$pkgver/rn_amd64")
sha256sums=('fe8811e82142248110822a305fb8ee40337a6bf5bb09e9650c07ae414c38ec71')

package() {
    install -Dm755 "rn_amd64" "$pkgdir/usr/bin/rn"
}
