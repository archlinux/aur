# Maintainer: Corey Hinshaw <coreyhinshaw@gmail.com>

pkgname=sbkeys
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple script to generate Secure Boot keys"
arch=('any')
url="https://github.com/electrickite/sbkeys"
license=('GPL3')
depends=('efitools' 'coreutils' 'bash' 'python2' 'openssl')
source=('sbkeys')

sha256sums=('f64107a1539c7f397386eb3b748f3c5d95965f3dad3bd5876d9ef8a101223c1b')

package() {
  install -Dm755 sbkeys "${pkgdir}/usr/bin/sbkeys"
}
