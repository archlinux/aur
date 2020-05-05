# Maintainer: Alec Mev <alec@mev.earth>

_name=minimal
pkgname="zsh-theme-${_name}"
pkgver=1.0.4
pkgrel=2
pkgdesc='A minimal and extensible Zsh theme'
arch=('any')
url=https://github.com/subnixr/minimal
license=('GPL3')
depends=('zsh')
optdepends=(
  'git: Git branch status support'
  'mercurial: Mercurial branch status support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/subnixr/minimal/archive/${pkgver}.tar.gz")
sha256sums=('910e109b366e4c334a6d0fc6021dc3810a4a7877bd985526dd63c5a12c00daf1')

package() {
  cd "minimal-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/zsh/plugins/theme-${_name}" minimal.zsh
}
