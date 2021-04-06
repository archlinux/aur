# Maintainer: Antonin Dach <dach@protonmail.com>
pkgname=librewolf-firefox-shim
pkgver=1
pkgrel=1
pkgdesc="A symlink for using librewolf as a firefox"
arch=('any')
url="https://librewolf-community.gitlab.io/"
license=('MIT')
depends=('librewolf')
provides=('firefox')
conflicts=('firefox')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which librewolf) "$pkgdir"/usr/bin/firefox
}
