# Maintainer: Iain Earl <iain at itmecho dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.1.0'
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
sha256sums=('e36175a9b2d3cff0c6490a6e4eca4cf3f8f21b94965526f00066500aefcddc3b')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
