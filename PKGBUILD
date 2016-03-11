# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-gc
pkgver=0.1.1.r120.bfad050
pkgrel=2
pkgdesc="A simple Docker container and image garbage collection script"
arch=('any')
url="https://github.com/spotify/docker-gc"
license=('Apache')
provides=('docker-gc')
conflicts=('docker-gc')
source=("https://raw.githubusercontent.com/spotify/docker-gc/bfad05074f734d9d642e822bbf03d65193bfb6c0/docker-gc")
md5sums=('2ea58e2031288833ee44487e956ccab6')
sha256sums=('fffc8c2492bef207d8c113732e5fd27d9c7832b1a8c52407e074a6018595f764')

depends=('bash')

package() {
  install -D -m755 "$srcdir"/docker-gc "$pkgdir/usr/bin/docker-gc"
  install -d -m755 "$pkgdir"/var/lib/docker-gc
}
