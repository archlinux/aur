# Maintainer: nitsky <david@yamnitsky.com>
arch=('x86_64')
license=('MIT')
pkgdesc="Yet another HTTPie clone"
pkgname=ht-bin
pkgrel=1
pkgver=0.4.0
provides=('ht')
sha256sums_x86_64=('d7d338708a097f5657a4fe971bf05d0ce4d90b5650bc189646a9c8f953df1db6')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/ducaale/ht/releases/download/v${pkgver}/ht-x86_64-unknown-linux-musl.tar.gz")
url='https://github.com/ducaale/ht'

package() {
  install -D -m755 ht "$pkgdir/usr/bin/ht"
}
