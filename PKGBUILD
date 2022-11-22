# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=posh-git-sh
pkgver=1.5.1
pkgrel=1
pkgdesc="Bash/Zsh version of the posh-git command prompt"
arch=('any')
url="https://github.com/lyze/${pkgname}"
license=('GPL3')
depends=('bash'
         'git')
optdepends=('zsh: alternative supported shell')
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lyze/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b18e09539bfff422fda112ea4643c081f990e25a641bef8f3089aec2f878fdd0efde9f1846437b78c70d3f4b8abef54074cd818a9f2086be565970b3ddbce1bf')

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm0644 git-prompt.sh "${pkgdir}/usr/share/${pkgname}/git-prompt.sh"
  install -vDm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 
}
