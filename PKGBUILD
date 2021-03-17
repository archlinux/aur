# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opencomic-bin
pkgver=0.2.0
pkgrel=3
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
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.x86_64.rpm")
source_arm64=("${pkgname}-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.arm64.rpm")
b2sums_x86_64=('e7f594edd70e0fab29c2d228c6636b6a4d56fc91e8a3ed30b22671e07a42b1983a21837d2529404a70b08abea49448720b4f522746c5db39785871afa909c32a')
b2sums_arm64=('5ae6138d45458d667ae0df2289b777ecf0b64deb15489210c1da676074bd5ebe698e6ba495d18d07eec9201657679cc1dc4a9ffa61ee570dba34820084251bad')

package() {
  rm -rf usr/lib
  cp -aR usr/ "${pkgdir}/"
  cp -aR opt/ "${pkgdir}/"
}
# vim:set ts=2 sw=2 et: