pkgname=pocketbase-bin
pkgver=0.36.1
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
source=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('6b6bce15974f41541a413f4160310509bd1442eaae1b069f909324af68f72f5c')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
