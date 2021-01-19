# Maintainer: Iain Earl <iain at itmecho dot com>
# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.14.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=()
optdepends=('fzf' 'skim')
makedepends=()
checkdepends=()
provides=('navi')
conflicts=('navi')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/denisidoro/navi/releases/download/v${pkgver}/navi-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('8d768c7a5e3d92a793b7b5bf79bd0cd149a3e028f4551a2a14c4623f7bb10ae2')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
