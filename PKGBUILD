# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=zsh-history-manager
pkgver=0.0.1
pkgrel=1
pkgdesc="Backup and restore ZSH history "
arch=('any')
url="https://github.com/rchakra3/zsh_history"
license=('gpl2')
depends=('python3' 'zsh')
source=("${pkgname}::git+${url}")
b2sums=('SKIP')

package() {
  cp "${srcdir}/${pkgname}/src/hist.py" "${srcdir}/zsh_history_manager"
  install -Dm755 "${srcdir}/zsh_history_manager" \
                 "${pkgdir}/usr/bin/zsh_history_manager"
}
