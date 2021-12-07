pkgname=xenia-bin
pkgver=r6144.130888dbf
pkgrel=4
pkgdesc='Xenia is an experimental emulator for the Xbox 360. Compiled binary from latest commit.'
arch=('x86_64')
url='https://xenia.jp'
license=('BSD')
options=('!strip')
depends=('gtk3' 'lz4' 'glew' 'libx11')
provides=('xenia')
conflicts=('xenia')
source=('https://github.com/HMKnapp/aur-xenia-bin/releases/download/r6144.130888dbf/xenia.r6144.130888dbf.tar.xz')
sha256sums=('8599a3166bde7b7b4ed06109a28f3dc1ee03fa6b5d1fa463516e1a035033e522')

  # this PKGBUILD package is automatically created
  #
  # xenia repo:    https://github.com/bwrsandman/xenia
  #
  # report issues: https://github.com/HMKnapp/xenia-bin/issues
  # contribute:    https://github.com/HMKnapp/xenia-bin/pulls

package() {
  install -Dm755 "${srcdir}"/usr/bin/xenia "${pkgdir}"/usr/bin/xenia
}
