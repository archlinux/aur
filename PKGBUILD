# Maintainer: Husam Bilal <me@husam.dev>

pkgname=what-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Display network utilization by process, connection and remote address"
arch=(x86_64)
url="https://github.com/imsnif/what"
license=(MIT)
provides=(what)
conflicts=(what what-git)
source=("https://github.com/imsnif/what/releases/download/${pkgver}/what-v${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")
md5sums=("44ec28b27b13392d8fb7033ddcf6270d")

package() {
  install -Dm755 what $pkgdir/usr/bin/what
}
