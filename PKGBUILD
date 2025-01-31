# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Roberto Polverelli Monti <rpolverelli at gmail>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.8.19
pkgrel=2
pkgdesc='A command line tool which helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
provides=('z.lua')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ef09629900421ff894df7e1cb16134e594e8af20364c900804c4a939fae48f4c')

package() {
  cd "${pkgname}-${pkgver}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish ranger_zlua.py README.md z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
