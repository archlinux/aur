# Maintainer: Bruno Galeotti <bgaleotti AT gmail DOT com>
pkgname=blackfire-cli
pkgver=1.14.1
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
source_i686=("blackfire-cli-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_386")
source_x86_64=("blackfire-cli-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_amd64")
md5sums_i686=('f4c6c821a3c69568c68146c97c959dee')
md5sums_x86_64=('e39881228cef3136c2fec04a58793519')

package(){
  install -Dm 755 blackfire-cli-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire
}
