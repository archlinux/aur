# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opencomic-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Comic and Manga reader, written with Node.js and using Electron'
arch=('x86_64')
url="https://github.com/ollm/OpenComic"
license=('GPL3')
provides=('opencomic')
depends=('libexif'
         'libgsf'
         'gtk3'
         'nss'
         'libxss'
         'lib32-gcc-libs'
         'nodejs'
         'orc'
         'libwebp'
         'libcroco'
         'libjpeg-turbo')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.x86_64.rpm")
sha256sums=('f73cbbb9d91a6508fdc1603e32b315dc54618b94d79989345b799a924214d529')

package() {
  rm -rf usr/lib
  cp -aR usr/ "${pkgdir}/"
  cp -aR opt/ "${pkgdir}/"
}
# vim:set ts=2 sw=2 et: