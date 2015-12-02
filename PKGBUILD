# Maintainer: zfo <zfoofz1 at gmail dot com>
# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Roman Timushev <rtimush@gmail.com>

pkgname=mc-solarized-git
_gitname=mc-solarized-skin
pkgver=2
pkgrel=1
pkgdesc="Solarized color scheme for Midnight Commander"
arch=('any')
url="https://github.com/nkulikov/mc-solarized-skin"
license=('unknown')
depends=('mc')
makedepends=('git')
source=("git://github.com/nkulikov/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git rev-list --count HEAD
}

package() {
  cd "$_gitname"
  install -D -m644 solarized.ini "$pkgdir/usr/share/mc/skins/solarized.ini"
}
