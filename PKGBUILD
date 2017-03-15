# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=arch-wiki-cli
pkgver=0.3
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
source=(git+https://github.com/deadhead420/arch-wiki.git)
md5sums=('SKIP')

package() {
  cd "${srcdir}"/arch-wiki
  install -Dm755 arch-wiki.sh "$pkgdir"/usr/bin/arch-wiki
  install -Dm644 archlinux.png "$pkgdir"/usr/share/pixmaps/archlinux.png
  install -Dm644 arch-wiki.desktop "$pkgdir"/usr/share/applications/arch-wiki.desktop
}

# vim:set ts=2 sw=2 et:
