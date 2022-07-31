# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=posh-git-sh
pkgver=1.4.0
pkgrel=1
pkgdesc="Bash/Zsh version of the posh-git command prompt"
arch=('any')
url="https://github.com/lyze/${pkgname}"
license=('GPL3')
depends=('bash'
         'git')
optdepends=('zsh: alternative supported shell')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lyze/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ef4a991782590e5a52243711ee49cb074454eb3cd622a0a95576a05b3b889ae5')

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm0644 git-prompt.sh "${pkgdir}/usr/share/${pkgname}/git-prompt.sh"
  install -vDm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 
}
