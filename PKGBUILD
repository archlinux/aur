# Maintainer: ArchStrike <team@archstrike.org>
# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=pentmenu
pkgver=1.3.3
pkgrel=1
groups=('archstrike' 'archstrike-misc')
arch=('any')
pkgdesc="A bash script inspired by pentbox."
url="https://github.com/GinjaChris/pentmenu"
license=('GPL3')
depends=('bash' 'hping' 'openbsd-netcat' 'openssl' 'stunnel' 'nmap' 'whois')
source=("https://github.com/GinjaChris/pentmenu/archive/$pkgver.tar.gz")
sha512sums=('d7754460eeadded1d29d5c625239b424390be9be25c175bcb173f4b60b37a69287f40912888c8e68706f8dbd30b3d2831459f12bc087dea40b5fb05e83c49211')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 pentmenu "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
