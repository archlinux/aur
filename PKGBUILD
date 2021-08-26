# Maintainer: 7k5x<7k5xlp0onfire@gmail.com>
pkgname=zoom-libnimf
pkgver=1.3.0
pkgrel=1
pkgdesc="Nimf library for zoom multilingual input."
arch=('x86_64')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
depends=('nimf' 'zoom')
source=("libqt5im-nimf.so")
sha256sums=('d246c02a20a1e4ea123f9c2275dfc4a2ea091a65032ddbbe8a59bfc71418f60c')

package() {
  mkdir ${pkgdir}/opt
  mkdir ${pkgdir}/opt/zoom
  mkdir ${pkgdir}/opt/zoom/platforminputcontexts
   cp libqt5im-nimf.so ${pkgdir}/opt/zoom/platforminputcontexts/libqt5im-nimf.so
}
