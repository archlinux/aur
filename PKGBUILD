# monggle-dvd-autoexec/PKGBUILD

pkgname=monggle-dvd-autoexec
pkgver=1.0
pkgrel=1
pkgdesc="몽글몽글~! DVD 넣으면 자동실행 되는 패키지~!"
arch=('any')
url="https://개발자양반.info"
license=('MIT')
depends=('bash' 'libnotify' 'udisks2')
source=('monggle-watch' '99-monggle.rules')
md5sums=('SKIP' 'SKIP')

package() {
  install -Dm755 monggle-watch "$pkgdir/usr/bin/monggle-watch"
  install -Dm644 99-monggle.rules "$pkgdir/etc/udev/rules.d/99-monggle.rules"
}
