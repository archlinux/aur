# Maintainer: Serge Ovanesyan
pkgname=calendarchy-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Terminal calendar app for Google Calendar and iCloud'
arch=('x86_64')
url='https://github.com/sovanesyan/calendarchy'
license=('MIT')
provides=('calendarchy')
conflicts=('calendarchy')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/calendarchy-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7321e46d27c330708e14aa1dd3ffec4d6561ae3cdba384c46e15d2cd6d099fbc')

package() {
  install -Dm755 calendarchy "$pkgdir/usr/bin/calendarchy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
