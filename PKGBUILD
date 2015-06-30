# Maintainer: Bruno Galeotti <bgaleotti AT gmail DOT com>
pkgname=blackfire-cli
pkgver=0.26.4
pkgrel=1
pkgdesc='Blackfire Profiler - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license='custom'
source_i686=("blackfire-cli-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_386")
source_x86_64=("blackfire-cli-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-cli-linux_amd64")
sha256sums_i686=('a1e474c57426abc56012707ec48453e57fe77a353d25c15b6ec19939ce406a1b')
sha256sums_x86_64=('e854395b8ab0f217f3c2858f04ae81a3db7e72a97536a3176926d98c9ec11aee')

package(){
  install -Dm 755 blackfire-cli-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire
}
