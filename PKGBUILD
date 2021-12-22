# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
pkgname=base16
pkgver=20170923
pkgrel=1
pkgdesc="base16 (hex) encode/decode data and print to standard output"
url="https://github.com/emanuelduss/Scripts/blob/master/base16"
license=('custom')
source=('https://raw.githubusercontent.com/emanuelduss/Scripts/master/base16'
        'https://raw.githubusercontent.com/emanuelduss/Scripts/master/LICENSE')
sha256sums=('4482327de7e082f08e26d41c4a5b9d8e5adeb1780fc98ae22fb2cdec54f3c24d'
            '1aa1b3610e6a8f9776bbacfddd3c6818244dc3268c8661f41b6aed7293fadb2d')

arch=('i686' 'x86_64')
depends=(perl)

package(){
  install -D -m755 "${srcdir}/base16" "${pkgdir}/usr/bin/base16"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
