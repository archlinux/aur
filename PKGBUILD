# Maintainer: Husam Bilal <me@husam.dev>

pkgname=bandwhich-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Display network utilization by process, connection and remote address"
arch=(x86_64)
url="https://github.com/imsnif/bandwhich"
license=(MIT)
provides=(bandwhich)
conflicts=(bandwhich bandwhich-git)
source=("https://github.com/imsnif/bandwhich/releases/download/${pkgver}/bandwhich-v${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=("552a8df5680b468486a1b45f5842ac30")

package() {
  install -Dm755 bandwhich $pkgdir/usr/bin/bandwhich
}
