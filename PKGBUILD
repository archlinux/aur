# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="Yet another HTTPie clone"
pkgname=ht-bin
pkgrel=1
pkgver=0.5.0
provides=('ht')
sha256sums_x86_64=('2ed08371fc4a4e6b5b08dd30411da6939094cee4bdbf6ca649d9f8839cccc85c')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/ducaale/ht/releases/download/v${pkgver}/ht-x86_64-unknown-linux-musl.tar.gz")
url='https://github.com/ducaale/ht'

package() {
  install -D -m755 ht "$pkgdir/usr/bin/ht"
}
