# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=z.lua
pkgver=1.8.7
pkgrel=1
pkgdesc='A new cd command that helps you navigate faster by learning your habits'
arch=('any')
url='https://github.com/skywind3000/z.lua'
license=('MIT')
depends=('lua')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8c67ae52c9c3926b16f0c64a046726c3d872de92add10b1ba1b0c4a659271be9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -D -t "${pkgdir}/usr/share/${pkgname}/" \
    init.fish README.md test_path.lua z.cmd z.lua z.lua.plugin.zsh
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-*}/" LICENSE
}
