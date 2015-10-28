# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-gc
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple Docker container and image garbage collection script"
arch=('any')
url="https://github.com/spotify/docker-gc"
license=('Apache')
provides=('docker-gc')
conflicts=('docker-gc')
source=("https://raw.githubusercontent.com/spotify/docker-gc/3a713748e60f209b5cb29205220a3595fd988623/docker-gc")
md5sums=('34b123a7f62e64f4f657c3b6fd124be0')
sha256sums=('d6b98de40fec140482d6cdb1d060c264175258f7b079b1ae6c4ecc290fe69753')

depends=('bash')

package() {
  install -D -m755 "$srcdir"/docker-gc "$pkgdir/usr/bin/docker-gc"
  install -d -m755 "$pkgdir"/var/lib/docker-gc
}
