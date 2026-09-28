# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('f92707ca656a987543f86c3105c7b6589e0945f78cb1f4fd25d458e14df10e203eab3937d117f387de647d1bf6a6338ad7571ddcd3972511095043fb68eaf31f')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
