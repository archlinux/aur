# Maintainer: Husam Bilal <me@husam.dev>

pkgname=bandwhich-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Display network utilization by process, connection and remote address"
arch=(x86_64)
url="https://github.com/imsnif/bandwhich"
license=(MIT)
provides=(bandwhich)
conflicts=(bandwhich bandwhich-git)
source=("https://github.com/imsnif/bandwhich/releases/download/${pkgver}/bandwhich-v${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=("7bb5ee0e31b8fa2fb7f3c2539c4979f4")

package() {
  install -Dm755 bandwhich $pkgdir/usr/bin/bandwhich
}
