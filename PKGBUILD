# Maintainer: Antonin Dach <dach@protonmail.com>
pkgname=librewolf-firefox-shim
pkgver=87.0
pkgrel=1
pkgdesc="A symlink for using librewolf as a firefox"
arch=('any')
url="https://librewolf-community.gitlab.io/"
license=('MIT')
depends=('librewolf')
provides=(
  "firefox=${pkgver}"
)
conflicts=(
  "firefox"
)

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/librewolf "$pkgdir"/usr/bin/firefox
}
