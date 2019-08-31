# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=dtrace-utils-devel
pkgver=1.2.1
pkgrel=5
pkgdesc="DTrace-utils contains the Userspace portion of the DTrace port to Linux"
arch=('x86_64')
url="https://github.com/oracle/dtrace-utils/"
license=('GPL')
makedepends=('rsync')

source=("http://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/dtrace-utils-devel-1.2.1-1.el7.x86_64.rpm")
md5sums=('832eb0681c58fa59eb435a9bd82c055d')

package() {
  rsync -ruDq "$srcdir/usr" "$pkgdir"
  mv "$pkgdir"/usr/lib{64,}
}
