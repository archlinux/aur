# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=1.3
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('b7e2e9c6a22daf0139d759bea2fdefe745cc8b69ba216e6dab660a710dcb1eed')

package() {
  cd sudo
  install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
