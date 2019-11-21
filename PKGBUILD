# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=pamac-zsh-completions
pkgver=0.4
pkgrel=1
pkgdesc="ZSH completions for pamac"
depends=('zsh' 'pamac')
license=('GPL')
arch=('any')
source=('_pamac')
sha256sums=('7b84ef418b68a4edf53a4d6afaeb7edc287a87fa7f970cf940a5ebdf37b891e6')

package() {
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    cp _pamac "${pkgdir}/usr/share/zsh/site-functions"
}
