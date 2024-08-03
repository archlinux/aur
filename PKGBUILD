# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=1.4
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('cbb84bbfd5394734800f6156baf5253c03609ba871d971d4f7bd74f24effc9d5')

package() {
  cd sudo
  install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
