# Maintainer: Sergey Ovanesyan <sergey@ovanesyan.com>
pkgname=calendarchy-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Terminal calendar app for Google Calendar and iCloud'
arch=('x86_64')
url='https://github.com/sovanesyan/calendarchy'
license=('MIT')
provides=('calendarchy')
conflicts=('calendarchy')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/calendarchy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('931f641a31a42066fdc238f1c5ca4ec78758cf6a69d0d7d214dcbe1e893180fd')

package() {
  install -Dm755 calendarchy "$pkgdir/usr/bin/calendarchy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
