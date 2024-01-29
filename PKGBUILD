# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=ttf-topaz-unicode
pkgver=1
pkgrel=1
pkgdesc='A version of the Amiga 500 "Topaz" font updated for the 21st century'
arch=('any')
url='https://gitlab.com/Screwtapello/topaz-unicode'
license=('LicenseRef-Custom-ISC')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/Screwtapello/topaz-unicode/-/jobs/6036905109/artifacts/download"
        "https://gitlab.com/Screwtapello/topaz-unicode/-/raw/main/LICENSE")
b2sums=('7cee7f0651045c63400f9f59d83f5721024d44532c5eedaa594233179e599d618067456655b06e81f8966a57e73f3f8fc7c832fbec756ecf25d12b8c816a2dbd'
        '76e5489cc124d7e93634926e28a88337ebc631dc25c126aff06477bc030fac751abd5d7199b7e9ed600ec0b6510e01ec8540b20a51a747202e288b3888c5de9b')

package() {
  install -dm755 ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
