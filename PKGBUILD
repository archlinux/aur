# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=please-sudo
pkgver=1
pkgrel=1
pkgdesc="A symlink for using please as a drop-in replacement to sudo"
arch=('any')
url="https://aur.archlinux.org/packages/please-sudo"
license=('MIT')
depends=('please')
provides=('sudo')
conflicts=('sudo')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which please) "$pkgdir"/usr/bin/sudo
}
