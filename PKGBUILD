# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=pamac-zsh-completions
pkgver=0.3
pkgrel=1
pkgdesc="ZSH completions for pamac"
depends=('zsh' 'pamac')
license=('GPL')
arch=('any')
source=('_pamac')
sha256sums=('1f9252577ee50be1520df6cc01ce9e768f386823f9065dee91e5d3c57574a8f5')

package() {
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    cp _pamac "${pkgdir}/usr/share/zsh/site-functions"
}
