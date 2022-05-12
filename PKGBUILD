# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=vim-solidity
pkgver=1.0
pkgrel=1
pkgdesc="Vim syntax file for Solidity."
arch=('any')
url="https://github.com/tomlion/vim-solidity"
commit="569bbbedc3898236d5912fed0caf114936112ae4"
depends=('vim')
license=("MIT")
source=("${pkgname}::git+${url}#commit=${commit}")
sha256sums=("SKIP")

package() {
  cd ${pkgname} 
  DEST=${pkgdir}/usr/share/vim/vimfiles
  mkdir -p "${DEST}"
  cp -r ftdetect ${DEST}
  cp -r ftplugin ${DEST}
  cp -r indent ${DEST}
  cp -r syntax ${DEST}
}
