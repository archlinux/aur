# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=iaca
pkgver=3.0
pkgrel=3
pkgdesc="Intel® Architecture Code Analyzer AUR install package."
arch=('x86_64')
url="https://software.intel.com/en-us/articles/intel-architecture-code-analyzer"
license=('custom')
depends=('gcc-libs-multilib' 'bash')
source=('https://software.intel.com/content/dam/develop/external/us/en/protected/iaca-version-v3.0-lin64.zip' 'LICENSE')
sha256sums=('e16e7a38985c5955576ed8cd0c77d38332b8a731e2b6ea36e72c19f1fa0aa861' 'a99a7f888fe718fb99e077211b00687e9f34b2ca0b6b1a0c7b8a80a1d6ba61a6')

package() {
  install -D -m755 -t "${pkgdir}/usr/bin" "${srcdir}/iaca-lin64/iaca"
  install -D -m644 -t "${pkgdir}/usr/include" "${srcdir}/iaca-lin64/iacaMarks.h"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

