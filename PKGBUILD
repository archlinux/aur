pkgname=xenia-bin
pkgver=r6144.130888dbf
pkgrel=2
pkgdesc='Xenia is an experimental emulator for the Xbox 360. Compiled binary from latest commit.'
arch=('x86_64')
url='https://xenia.jp'
license=('BSD')
options=('!strip')
depends=('gtk3' 'lz4' 'glew' 'libx11')
provides=('xenia')
conflicts=('xenia')
source=('https://github.com/HMKnapp/xenia-bin/releases/download/r6144.130888dbf/xenia.r6144.130888dbf.tar.xz')
sha256sums=('d0dbcd04760ae93d702f137345de7e48a5e15703d37455490c422c2781759177')

  # this PKGBUILD package is automatically created
  #
  # xenia repo:    https://github.com/bwrsandman/xenia
  #
  # report issues: https://github.com/HMKnapp/xenia-bin/issues
  # contribute:    https://github.com/HMKnapp/xenia-bin/pulls

package() {
  install -Dm755 "${srcdir}"/usr/bin/xenia "${pkgdir}"/usr/bin/xenia
}
