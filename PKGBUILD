# Maintainer: ArchStrike <team@archstrike.org>
# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=pentmenu
pkgver=1.3.0
pkgrel=1
groups=('archstrike' 'archstrike-misc')
arch=('any')
pkgdesc="A bash script inspired by pentbox."
url="https://github.com/GinjaChris/pentmenu"
license=('GPL3')
depends=('bash' 'hping' 'gnu-netcat' 'openssl' 'stunnel' 'nmap' 'whois')
source=("https://github.com/GinjaChris/pentmenu/archive/$pkgver.tar.gz")
sha512sums=('fd1121ee1841f00ae34d28258a5ffb770b1f23c8d66091bed5d76d65a739291daef5e63dc5708a7033bd8795e67ebe65c36641af5b36996d53acb3f90c08bc9d')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 pentmenu "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
