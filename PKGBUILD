# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-gc
pkgver=0.1.1.r116.5ebb00f
pkgrel=2
pkgdesc="A simple Docker container and image garbage collection script"
arch=('any')
url="https://github.com/spotify/docker-gc"
license=('Apache')
provides=('docker-gc')
conflicts=('docker-gc')
source=("https://raw.githubusercontent.com/spotify/docker-gc/5ebb00f5f163126c29661cf4ebb674505e77ff8e/docker-gc")
md5sums=('2ea58e2031288833ee44487e956ccab6')
sha256sums=('fffc8c2492bef207d8c113732e5fd27d9c7832b1a8c52407e074a6018595f764')

depends=('bash')

package() {
  install -D -m755 "$srcdir"/docker-gc "$pkgdir/usr/bin/docker-gc"
  install -d -m755 "$pkgdir"/var/lib/docker-gc
}
