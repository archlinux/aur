# Maintainer:  zoorat <zoorat at protonmail dot com>
# Contributor: Original submitter's  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opencomic-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='Comic and Manga reader, written with Node.js and using Electron'
arch=('x86_64') # 'arm64' is also available 
url="https://github.com/ollm/OpenComic"
license=('GPL3')
provides=('opencomic')
depends=('libexif'
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.${arch}.rpm")
sha256sums=('2862fe94318a12b34eb4432ca22d2792e7e49388024f142a63bd0298d956adfb')

package() {
  rm -rf usr/lib
  cp -aR usr/ "${pkgdir}/"
  cp -aR opt/ "${pkgdir}/"
}
# vim:set ts=2 sw=2 et: