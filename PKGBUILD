# Maintainer: Iain Earl <iain at itmecho dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.0.6'
pkgrel='1'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=('fzf')
optdepends=()
makedepends=()
checkdepends=()
provides=('navi')
conflicts=('navi')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/denisidoro/navi/releases/download/v${pkgver}/navi-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('c4018b19fc4622612d22a0566c483007aa5438e81d0909105b85b7fe8ac5ffeb')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
