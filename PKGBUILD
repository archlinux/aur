# Maintainer: ArchStrike <team@archstrike.org>
# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=pentmenu
pkgver=1.2.0
pkgrel=1
groups=('archstrike' 'archstrike-misc')
arch=('any')
pkgdesc="A bash script inspired by pentbox."
url="https://github.com/GinjaChris/pentmenu"
license=('GPL3')
depends=('bash' 'hping' 'gnu-netcat' 'openssl' 'stunnel' 'nmap' 'whois')
source=("https://github.com/GinjaChris/pentmenu/archive/$pkgver.tar.gz")
sha512sums=('81729731235c929a369cd87045e894108ccb063a27cabb1c079bda7e54aecad68ce73c5c7e7c2aaacdcce4f3bb54a3a0b91b97781f521dc3cbdb10623bb8780c')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 pentmenu "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
