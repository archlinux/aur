# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=1.2
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font/"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('161a8d81f882063fe54302c3fe0b2ce9bfc14065b6e1457278595826c41d6dc3')

package() {
  cd sudo
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}

# vim:set ts=2 sw=2 et:
