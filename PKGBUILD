# Maintainer: Iain Earl <iain at itmecho dot com>
# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.3.1'
pkgrel='2'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=('fzf')
optdepends=()
makedepends=()
checkdepends=()
provides=('navi')
conflicts=('navi')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/denisidoro/navi/releases/download/v${pkgver}/navi-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('5f1c99c0c380bc9e00ba68e78c68e72a98897160caa273fdd9252a99c9e84540')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
