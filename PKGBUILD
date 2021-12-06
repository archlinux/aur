pkgname=xenia-bin
pkgver=r6144.130888dbf
pkgrel=3
pkgdesc='Xenia is an experimental emulator for the Xbox 360. Compiled binary from latest commit.'
arch=('x86_64')
url='https://xenia.jp'
license=('BSD')
options=('!strip')
depends=('gtk3' 'lz4' 'glew' 'libx11')
provides=('xenia')
conflicts=('xenia')
source=('https://github.com/HMKnapp/aur-xenia-bin/releases/download/r6144.130888dbf/xenia.r6144.130888dbf.tar.xz')
sha256sums=('111bc865367c6a747bc8b805b71c77c1d8a31c8de0801616792f95985d65b2cc')

  # this PKGBUILD package is automatically created
  #
  # xenia repo:    https://github.com/bwrsandman/xenia
  #
  # report issues: https://github.com/HMKnapp/xenia-bin/issues
  # contribute:    https://github.com/HMKnapp/xenia-bin/pulls

package() {
  install -Dm755 "${srcdir}"/usr/bin/xenia "${pkgdir}"/usr/bin/xenia
}
