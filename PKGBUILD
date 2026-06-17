# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.5.20
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('5c360d6ad9d87a929e5a48472a9baf4ae69db43c05851fdb6c93e1df61c64809d1fc94a8fb7b741603cbf83572922f585995a6fbad8432cd5006ede3e688ec68')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
