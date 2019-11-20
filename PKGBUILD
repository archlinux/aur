# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=pamac-zsh-completions
pkgver=0.2
pkgrel=1
pkgdesc="ZSH completions for pamac"
depends=('zsh' 'pamac')
license=('GPL')
arch=('any')
source=('_pamac')
sha256sums=('389bb461e89c5d803743d29c1dd1d263b3d5330aca18d80ae1a4dd9cc5addec6')

package() {
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    cp _pamac "${pkgdir}/usr/share/zsh/site-functions"
}
