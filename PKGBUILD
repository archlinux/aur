pkgname=pocketbase-bin
pkgver=0.36.2
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
source=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('93f872a8afa29cfda330ee65042fbfc00d53d8b3dd052dbffbf70d6c32d07c78')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
