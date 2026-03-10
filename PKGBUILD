# Maintainer: Serge Ovanesyan
pkgname=calendarchy-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Terminal calendar app for Google Calendar and iCloud'
arch=('x86_64')
url='https://github.com/sovanesyan/calendarchy'
license=('MIT')
provides=('calendarchy')
conflicts=('calendarchy')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/calendarchy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('6ffe575fcde3f7faa91a6db0d4122640affdcbd5f3f235efeb8ed5a87f49994c')

package() {
  install -Dm755 calendarchy "$pkgdir/usr/bin/calendarchy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
