# Maintainer: Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=arch-wiki-cli
pkgver=0.1
pkgrel=1
pkgdesc="search in arch wiki from command line"
arch=('any')
url="https://github.com/deadhead420/archlinux/blob/master/wiki"
license=('GPL')
depends=('bash')
optdepends=(
  'lynx: to view the wiki inside your shell'
  'elinks: to view the wiki inside your shell'
  'links: to view the wiki inside your shell'
)
source='https://raw.githubusercontent.com/deadhead420/archlinux/master/wiki/wiki.sh'
md5sums=('13269023719830461f164fabb5d349b3')

package() {
  cd "${srcdir}"
  install -Dm755 wiki.sh $pkgdir/usr/bin/arch-wiki
}

# vim:set ts=2 sw=2 et:
