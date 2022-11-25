# Maintainer: Jan Marvin Garbuszus <jan[dot]garbuszus[at]ruhr-uni-bochum[dot]de>
pkgname=nodejs-v8
pkgver=19.1.0
pkgrel=1
pkgdesc='PKGBUILD to provide nodejs shared v8'
url="https://nodejs.org/"
arch=('x86_64')
depends=('nodejs>18.11.0')
license=('MIT')
provides=('v8')

package() { 

  mkdir -p ${pkgdir}/usr/{lib,include}
  ln -s /usr/lib/libnode.so ${pkgdir}/usr/lib/libv8.so
  ln -s /usr/lib/libnode.so ${pkgdir}/usr/lib/libv8_libplatform.so
  ln -s /usr/include/node/* ${pkgdir}/usr/include/ 
  rm -rf ${pkgdir}/usr/include/node*

}

# vim:set ts=2 sw=2 et:
