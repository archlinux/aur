# Maintainer: 7k5x<7k5xlp0onfire@gmail.com>
pkgname=zoom-libnimf
pkgver=1.3.0
pkgrel=1
pkgdesc="Nimf library for zoom multilingual input."
arch=('x86_64')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
depends=('nimf' 'zoom')

package() {
  mkdir ${pkgdir}/opt
  mkdir ${pkgdir}/opt/zoom
  mkdir ${pkgdir}/opt/zoom/platforminputcontexts
   ln -s /usr/lib/x86_64-linux-gnu/libnimf.so.1.0.0 ${pkgdir}/opt/zoom/platforminputcontexts/libnimfplatforminputcontexts.so
}
