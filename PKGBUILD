# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=ttf-sudo
pkgver=2.1
pkgrel=1
pkgdesc="A font for programmers and command line users"
arch=('any')
url="https://www.kutilek.de/sudo-font"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://github.com/jenskutilek/sudo-font/releases/download/v${pkgver}/sudo.zip")
sha256sums=('4d7d108cb41dc9a8edf8b6912a192ff56dc810f058f76f499d2a732ea59e7223')

package() {
  cd sudo
  install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
