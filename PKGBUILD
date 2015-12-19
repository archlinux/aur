# Maintainer: Georg Potthast <nospam at georgpotthast.de>
pkgname=netrider-bin
pkgver=0.94
pkgrel=2
pkgdesc="Webkit based browser"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/netrider/"
license=('BSD')
groups=()
depends=('libxft' 'libxinerama' 'gcc' 'sqlite' 'curl' 'libxslt' 'libxtst')

source_i686=("http://downloads.sourceforge.net/project/netrider/NetRider-${pkgver}-1.i586.rpm")
source_x86_64=("http://downloads.sourceforge.net/project/netrider/NetRider-${pkgver}-1.x86_64.rpm")

sha256sums_i686=('ac40e52fc0892cd1c0b44e56b7fd7958790097388b667824234ac8d8317c7db0')
sha256sums_x86_64=('d721839bb637fa32f58756034f59a5afcd76f4245842fe5b2f8cd6a67d10bc94')

package() {
  mkdir -p "$pkgdir/usr"
  cp -rn --preserve=timestamps "usr/local/bin" "$pkgdir/usr"
  cp -rn --preserve=timestamps "usr/local/lib" "$pkgdir/usr"
}
