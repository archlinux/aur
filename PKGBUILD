# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
pkgname=base16
pkgver=20170315
pkgrel=1
pkgdesc="base16 (hex) encode/decode data and print to standard output"
url="https://github.com/emanuelduss/Scripts/blob/master/base16"
license=('custom')
source=('https://raw.githubusercontent.com/mindfuckup/Scripts/master/base16'
        'https://raw.githubusercontent.com/mindfuckup/Scripts/master/LICENSE')
sha256sums=('f6b8592226e51dc5b6addb489db6acd117b80a5a8fe18c292993078ad1967109'
            '1aa1b3610e6a8f9776bbacfddd3c6818244dc3268c8661f41b6aed7293fadb2d')

arch=('i686' 'x86_64')
depends=(perl)

package(){
  install -D -m755 "${srcdir}/base16" "${pkgdir}/usr/bin/base16"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
