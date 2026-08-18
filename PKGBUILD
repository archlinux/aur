# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.5.26
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('1e1d38053cbb27d21b89ad0b17d0722c03769d805e03c433ea0d0f93ffefc7d4aa1e214e402de40b34dde326a0aaa23830fec27ce1d91697ebb7dc6c62d1a1a8')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
