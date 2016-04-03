# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-gc
pkgver=0.1.1.r122.fa99444
pkgrel=1
pkgdesc="A simple Docker container and image garbage collection script"
arch=('any')
url="https://github.com/spotify/docker-gc"
license=('Apache')
provides=('docker-gc')
conflicts=('docker-gc')
source=("https://raw.githubusercontent.com/spotify/docker-gc/fa99444919c37cb6e7866ee6e54a52d50913f4d6/docker-gc")
md5sums=('875aaba002c337fa4452495569f51c6f')
sha256sums=('26bb2fc135ff7b89fa62daa9e810500a8f6d99107dd8d099a679788913338d6a')

depends=('bash')

package() {
  install -D -m755 "$srcdir"/docker-gc "$pkgdir/usr/bin/docker-gc"
  install -d -m755 "$pkgdir"/var/lib/docker-gc
}
