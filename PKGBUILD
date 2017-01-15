# Maintainer: ArchStrike <team@archstrike.org>
# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=pentmenu
pkgver=1.3.4
pkgrel=1
groups=('archstrike' 'archstrike-misc')
arch=('any')
pkgdesc="A bash script inspired by pentbox."
url="https://github.com/GinjaChris/pentmenu"
license=('GPL3')
depends=('bash' 'hping' 'openbsd-netcat' 'openssl' 'stunnel' 'nmap' 'whois')
source=("https://github.com/GinjaChris/pentmenu/archive/$pkgver.tar.gz")
sha512sums=('1016468fdf93423d8c1867fb046fa3dfdd6cee5f1835234be349e4b52a08750665010454e30bc8db3dc610f2611291968a803d0a0fa27163bd4c511adb3828f8')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 pentmenu "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
