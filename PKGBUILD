# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=pamac-zsh-completions
pkgver=0.7
pkgrel=1
pkgdesc="ZSH completions for pamac"
depends=('zsh' 'pamac')
license=('GPL')
arch=('any')
source=('_pamac')
sha256sums=('d1e23a0093494dc8868962695493c6f476f8730ced945e29b910b7de4443358f')

package() {
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    cp _pamac "${pkgdir}/usr/share/zsh/site-functions"
}
