# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=arch-wiki-cli
pkgver=0.3
pkgrel=2
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
source=('https://raw.githubusercontent.com/deadhead420/arch-wiki/master/arch-wiki.sh'
        'https://raw.githubusercontent.com/deadhead420/arch-wiki/master/archlinux.png'
        'https://raw.githubusercontent.com/deadhead420/arch-wiki/master/arch-wiki.desktop')
md5sums=('437f7de1ace85e9397b83ddacc8bcc54'
         '662ff5c5cb614669ae096b46b49818a9'
         'f2a1dc5091fe9bb20ea0afb1b102262d')
package() {
  cd "${srcdir}"
  install -Dm755 arch-wiki.sh "$pkgdir"/usr/bin/arch-wiki
  install -Dm644 archlinux.png "$pkgdir"/usr/share/pixmaps/archlinux.png
  install -Dm644 arch-wiki.desktop "$pkgdir"/usr/share/applications/arch-wiki.desktop
}

# vim:set ts=2 sw=2 et:
