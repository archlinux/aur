# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-gc
pkgver=0.1.1.r131.5005527
pkgrel=1
pkgdesc="A simple Docker container and image garbage collection script"
arch=('any')
url="https://github.com/spotify/docker-gc"
license=('Apache')
provides=('docker-gc')
conflicts=('docker-gc')
source=("https://raw.githubusercontent.com/spotify/docker-gc/420558e74413b63aa479a31a44d6039d6b255d66/docker-gc")
md5sums=('f12f02b1cd2a7ff6fda5e784797435c6')
sha256sums=('6168362cb3dcad79df6f80fad2adbf6224053dca51a862dd654c2f64a71efc59')

depends=('bash')

package() {
  install -D -m755 "$srcdir"/docker-gc "$pkgdir/usr/bin/docker-gc"
  install -d -m755 "$pkgdir"/var/lib/docker-gc
}
