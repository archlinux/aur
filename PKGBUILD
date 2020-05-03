# Maintainer: Bruno Galeotti <bgaleotti AT gmail DOT com>
pkgname=blackfire-cli
pkgver=1.34.0
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
source_i686=("blackfire-cli-${pkgver}_i686::https://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_386")
source_x86_64=("blackfire-cli-${pkgver}_x86_64::https://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_amd64")
md5sums_i686=('c076af95ad6a0b191627e58a7f67fdcc')
md5sums_x86_64=('aa270cc04f447c37697d8e86abf51185')

package(){
  install -Dm 755 blackfire-cli-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire
}
