# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=0.81
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font/"
license=('OFL-1.1')
source=("https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('7cb85250db95899ce9f894ff5559c71fe77ba8c6c7abbfaabec869d847963764')

package() {
  cd sudo
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}

# vim:set ts=2 sw=2 et:
