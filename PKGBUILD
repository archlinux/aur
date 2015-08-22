# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=iaca
pkgver=2.1
pkgrel=1
pkgdesc="Intel® Architecture Code Analyzer AUR install package."
arch=('x86_64')
url="https://software.intel.com/en-us/articles/intel-architecture-code-analyzer"
license=('custom')
depends=('gcc-libs-multilib' 'bash')
source=('https://software.intel.com/system/files/article/157552/iaca-lin64.zip' 'LICENSE')
md5sums=('d1d22f1044f0325a2832d237ddb5e95e' '5d35a259dd29bfd46e4705a96eb008f3')

package() {
  #Copy
  rm ${srcdir}/iaca-lin64/.DS_Store
  cp -r ${srcdir}/iaca-lin64/ ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

