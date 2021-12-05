pkgname=xenia-bin
pkgver=r6144.130888dbf
pkgrel=1
pkgdesc="Xenia is an experimental emulator for the Xbox 360."
arch=('x86_64')
url="http://xenia.jp"
license=('BSD')
options=('!strip')
depends=('gtk3' 'lz4' 'glew' 'libx11')
provides=('xenia')
conflicts=('xenia')
source=('https://github.com/HMKnapp/xenia-bin/releases/download/r6144.130888dbf/xenia.r6144.130888dbf.tar.xz')
sha256sums=('f53f1721cf31f3bb79bc258284d9b1d8c49358223bcf2b5a5df7060858a98636')

package() {
  install -Dm755 "${srcdir}"/usr/bin/xenia "${pkgdir}"/usr/bin/xenia
}
