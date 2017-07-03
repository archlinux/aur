# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=iaca
pkgver=2.2
pkgrel=1
pkgdesc="Intel® Architecture Code Analyzer AUR install package."
arch=('x86_64')
url="https://software.intel.com/en-us/articles/intel-architecture-code-analyzer"
license=('custom')
depends=('gcc-libs-multilib' 'bash')
source=('https://software.intel.com/system/files/managed/c1/29/iaca-version-2.2-lin64.zip' 'LICENSE')
sha256sums=('78aa82928930acb3bcb5a614df87f5af4d27f1984b2e3c18168d3c0a1b955efc' 'a99a7f888fe718fb99e077211b00687e9f34b2ca0b6b1a0c7b8a80a1d6ba61a6')

package() {
  #Copy
  rm ${srcdir}/iaca-lin64/.DS_Store
  cp -r ${srcdir}/iaca-lin64/ ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

