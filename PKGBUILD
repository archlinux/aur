# Maintainer: Bruno Galeotti <bgaleotti AT gmail DOT com>
pkgname=blackfire-cli
pkgver=1.15.0
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
source_i686=("blackfire-cli-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_386")
source_x86_64=("blackfire-cli-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_amd64")
md5sums_i686=('13c38f1e1b6a9f24c51cd0c845941000')
md5sums_x86_64=('79e8fec2ae30542a10b30bf5d85f9360')

package(){
  install -Dm 755 blackfire-cli-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire
}
