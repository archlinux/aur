# Maintainer: syrupderg <syrupderg at proton dot me>

pkgname=barfi-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line file uploader for buzzheavier"
arch=('x86_64')
url="https://github.com/burritoflakes/barfi"
license=('unknown')
provides=('barfi')
conflicts=('barfi')
source=("barfi-$pkgver::https://github.com/burritoflakes/barfi/releases/download/v${pkgver}/barfi-linux-amd64")
sha256sums=('SKIP')

package() {
  install -Dm755 "barfi-$pkgver" "$pkgdir/usr/bin/barfi"
}
