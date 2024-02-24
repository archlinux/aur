# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=1.0
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font/"
license=('OFL-1.1')
source=("https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('e95efe89a6e5627f9eb875c91eb22e80e704a20ad2725894c3169655a4bff57e')

package() {
  cd sudo
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}

# vim:set ts=2 sw=2 et:
