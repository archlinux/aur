# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Roberto Polverelli Monti <rpolverelli at gmail>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.8.24
pkgrel=1
pkgdesc='A command line tool which helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
provides=('z.lua')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ed749f4cdc9ca4315a74dca0918b1e12d5961b9c16754907ef492c4ae0bfccd3')

package() {
  cd "${pkgname}-${pkgver}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish ranger_zlua.py z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
