# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Roberto Polverelli Monti <rpolverelli at gmail>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.8.18
pkgrel=1
pkgdesc='A command line tool which helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
provides=('z.lua')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e6634c40db18f1901eb054322d5d1962abc6f16e2fef0882249f879ff6e897a8')

package() {
  cd "${pkgname}-${pkgver}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish README.md z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
