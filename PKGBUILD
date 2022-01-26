# Maintainer: Iain Earl <iain at itmecho dot com>
# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname='navi-bin'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.19.0'
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
sha256sums=('abba422824669981d4f9c16d9895feb3075c2149289b2fc87ce17b56f316ce9c')

package() {
    install -Dm755 "navi" "$pkgdir/usr/bin/navi"
}
