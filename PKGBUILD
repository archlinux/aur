# Maintainer: Iain Earl <iain at itmecho dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.0.4'
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
sha256sums=('06895d88ddc144ec3d55fc80340b4fd68446697c513e5a4d68f8bff05965247c')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
