#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=pdf.js
pkgver=1.6.210
pkgrel=1
pkgdesc='A general-purpose, web standards-based platform for parsing and rendering PDFs.'
arch=('any')
url='https://mozilla.github.io/pdf.js/'
license=('Apache')
source=("https://github.com/mozilla/$pkgname/releases/download/v$pkgver/pdfjs-$pkgver-dist.zip")
sha256sums=('53997edad2635983406a33d99c04db14b139aabbeddc63bc3b6cb60d830a4a90')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./{web,build/*.js} ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
