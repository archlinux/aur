# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=1.1
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font/"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('a8642658e01337827c8d8507b004f7b9d7fe52d3f6e9d0901668611f0dd25e0b')

package() {
  cd sudo
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}

# vim:set ts=2 sw=2 et:
