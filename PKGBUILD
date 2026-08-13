# Maintainer: tee < teeaur at duck dot com >
pkgname=sling-cli-bin
pkgver=1.5.24
pkgrel=1
pkgdesc="Sling is a CLI tool that extracts data from a source storage/database"
arch=(x86_64)
url='https://docs.slingdata.io'
license=('GPL-3.0-or-later')
provides=('sling')
conflicts=('sling')
source=("$pkgname-$pkgver.tgz::https://github.com/slingdata-io/sling-cli/releases/download/v$pkgver/sling_linux_amd64.tar.gz")
b2sums=('f5f37625ec150174a19e1cd394cccf288c1e426d39123ea83eb3bd37dd23994c3cff2de794f1038feb12b28a42be4a658c5146a8e06de0d7a7908cd53dc6ffd8')

package() {
  install -Dm755 sling -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
