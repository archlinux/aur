# Maintainer: Serge Ovanesyan
pkgname=calendarchy-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Terminal calendar app for Google Calendar and iCloud'
arch=('x86_64')
url='https://github.com/sovanesyan/calendarchy'
license=('MIT')
provides=('calendarchy')
conflicts=('calendarchy')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/calendarchy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b4973df728276c54aa54404e62e00e324a33c84959b0fe7ce34c38a2280d189c')

package() {
  install -Dm755 calendarchy "$pkgdir/usr/bin/calendarchy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
