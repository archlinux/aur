# Maintainer: Serge Ovanesyan
pkgname=calendarchy-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Terminal calendar app for Google Calendar and iCloud'
arch=('x86_64')
url='https://github.com/sovanesyan/calendarchy'
license=('MIT')
provides=('calendarchy')
conflicts=('calendarchy')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/calendarchy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3362f330f354198c2bb0215641fce5a618d302e5431e6364dfab1c89deae9ab0')

package() {
  install -Dm755 calendarchy "$pkgdir/usr/bin/calendarchy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
