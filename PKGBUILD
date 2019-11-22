# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=pamac-zsh-completions
pkgver=0.5
pkgrel=1
pkgdesc="ZSH completions for pamac"
depends=('zsh' 'pamac')
license=('GPL')
arch=('any')
source=('_pamac')
sha256sums=('8bf6f7c0ac4eca2c509caea787969f1858c87b667506af4785ad335221437e47')

package() {
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    cp _pamac "${pkgdir}/usr/share/zsh/site-functions"
}
