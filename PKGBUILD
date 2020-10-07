# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=ksync-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="A tool to transparently update containers running on the cluster from local checkout"
arch=('x86_64')
url="https://github.com/loadimpact/k6"
license=('apache')
source=("ksync::https://github.com/ksync/ksync/releases/download/${pkgver}/ksync_linux_amd64")
sha256sums=('8f3a4cdac32274af0d5b333892e1b407823f1072fa9634a4fc46bde6d4050450')

package() {
  install -D $srcdir/ksync $pkgdir/usr/bin/ksync
}
