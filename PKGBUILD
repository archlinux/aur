# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=arch-wiki-cli
pkgver=0.2
pkgrel=1
pkgdesc="Search the arch wiki from the cli"
arch=('any')
url="https://github.com/deadhead420/arch-wiki"
license=('GPL')
depends=('bash')
optdepends=(
  'lynx: to view the wiki inside your shell'
  'elinks: to view the wiki inside your shell'
  'links: to view the wiki inside your shell'
)
source=('https://raw.githubusercontent.com/deadhead420/arch-wiki/master/arch-wiki.sh')
md5sums=('b358943235f2413e429bef8890b3c2ea')

package() {
  cd "${srcdir}"
  install -Dm755 arch-wiki.sh $pkgdir/usr/bin/arch-wiki
}

# vim:set ts=2 sw=2 et:
