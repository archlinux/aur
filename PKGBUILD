# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Roberto Polverelli Monti <rpolverelli at gmail>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.8.20
pkgrel=1
pkgdesc='A command line tool which helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
provides=('z.lua')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3d5afb8d617e956ac7385e2cd5082991630705566ddc0871295404e16a05445c')

package() {
  cd "${pkgname}-${pkgver}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish README.md z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
