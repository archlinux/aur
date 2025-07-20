pkgname=nextor-ip-changer
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to change TOR IP instantly using a single click"
arch=('any')
url="https://github.com/Stalin-143/NexTOR_IP_CHANGER"
license=('MIT')
depends=('python' 'tor')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/NexTOR_IP_CHANGER/Nex_Tor_IP_changer"

  install -Dm755 NexTOR.py "$pkgdir/usr/bin/nextor"
  chmod +x "$pkgdir/usr/bin/nextor"

  install -Dm644 "$srcdir/NexTOR_IP_CHANGER/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/NexTOR_IP_CHANGER/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
