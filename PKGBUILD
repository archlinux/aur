# Maintainer: Martin Fritzsche <aur at mafri dot org>
pkgname=snmpscan
pkgver=1.6.2
pkgrel=1
pkgdesc="CLI-Tool to monitor ruters and switches by SNMP"
arch=('any')
url="https://github.com/mafri27/snmpscan"
depends=('ruby') 
makedepends=('git')
license=('GPL3')
source=("snmpscan::git+https://github.com/mafri27/snmpscan.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  install -Dm755 snmpscan.rb "$pkgdir/usr/bin/snmpscan"
}

