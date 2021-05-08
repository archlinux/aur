# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=ksync-bin
pkgver=0.4.7
pkgversuffix=-hotfix
pkgrel=1
pkgdesc="A tool to transparently update containers running on the cluster from local checkout"
arch=('x86_64')
url="https://github.com/ksync/ksync"
license=('apache')
source=("ksync::https://github.com/ksync/ksync/releases/download/${pkgver}${pkgversuffix}/ksync_linux_amd64")
sha256sums=('68f2d51b83b12e7bf3e27277ff87bd656748779fac1abbe742bce930553923e3')

package() {
  install -D $srcdir/ksync $pkgdir/usr/bin/ksync
}
