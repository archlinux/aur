# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=plugn
pkgver=0.3.0
pkgrel=1
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('bsd')

source=("https://github.com/dokku/plugn/releases/download/v${pkgver}/plugn_${pkgver}_linux_x86_64.tgz")
sha256sums=('ede923ac9ebaff1ef6b3a7e9a362ef71821d737f4b09dc6a2013e2513f855a77')

package(){
  install -Dm 755 plugn "$pkgdir"/usr/bin/plugn
}
