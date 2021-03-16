# Maintainer: Roberto Polverelli Monti <rpolverelli at gmail>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.8.12
pkgrel=1
pkgdesc='A new cd command that helps you navigate faster by learning your habits.'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
provides=('z.lua')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1c3d871bf625b5a2eef9ecbb4face9d6432565d05ea8d26322b7a65b2e1d99d2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish README.md test_path.lua z.cmd z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-*}/" LICENSE
}
