# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opencomic-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Comic and Manga reader, written with Node.js and using Electron'
arch=('x86_64' 'arm64')
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

source_x86_64=("opencomic-bin-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.x86_64.rpm")
source_arm64=("opencomic-bin-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.aarch64.rpm")

b2sums_x86_64=('d2d7effcd0e63fae25c95905d0e1d8a571b25d1ca073af7bebfc3efda25a90423d7a4307cb205be0c5bac91aa92aba65cda2b4cc9406a177ef2c868b4d70c310')
b2sums_arm64=('252338e4f02abf74b8097fb781d5861f93ccf245bd3accabe81103b3f553a12b49252967a0676657b9475993ee489a8167096f87380c14507a5c3763a95013eb')

package() {
  rm -rf usr/lib
  cp -aR usr/ "${pkgdir}/"
  cp -aR opt/ "${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
