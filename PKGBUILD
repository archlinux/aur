# Maintainer: Iain Earl <iain at itmecho dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.1.1'
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
sha256sums=('1f14a55fdef7a43e51592b6746a263bfc6fd5379162569a34f6c8fdb9c97b7a0')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
