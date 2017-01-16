# Maintainer: ArchStrike <team@archstrike.org>
# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=pentmenu
pkgver=1.4
pkgrel=1
groups=('archstrike' 'archstrike-misc')
arch=('any')
pkgdesc="A bash script inspired by pentbox."
url="https://github.com/GinjaChris/pentmenu"
license=('GPL3')
depends=('bash' 'hping' 'openbsd-netcat' 'openssl' 'stunnel' 'nmap' 'whois')
source=("https://github.com/GinjaChris/pentmenu/archive/$pkgver.tar.gz")
sha512sums=('eff5a021c229a6f575e3054c135afa3e008da62648dcb78fca792f5bbd8f5f04acdb3a1185d78275cff7cde1b73edd17449a476a895cf22d19fd3a7768254a16')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 pentmenu "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
