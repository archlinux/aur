# Maintainer: SClause <arch@sclause.net>

pkgname=grandorgue
pkgver=3.4.1_1
pkgrel=1
pkgdesc='Virtual Pipe Organ Software - Binary package'
arch=('x86_64')
url='https://github.com/GrandOrgue/grandorgue'
license=('GPL2')
depends=(fftw wavpack wxgtk3 jack)
replaces=(grandorgue-svn)
conflicts=(grandorgue-git)
source=("$url/releases/download/${pkgver//_/-}/grandorgue-${pkgver//_/-}.linux.$CARCH.tar.gz")
md5sums=('9908cfc2c18b71a8f965bd7bdb4dd0c9')

package() {
  godir=$srcdir/grandorgue-${pkgver//_/-}.linux.$CARCH
  mkdir $pkgdir/usr
  cp -r $godir/bin $pkgdir/usr/bin
  cp -r $godir/lib $pkgdir/usr/lib
  cp -r $godir/share $pkgdir/usr/share
}

