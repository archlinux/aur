pkgname=pocketbase-bin
pkgver=0.36.3
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
source=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('4582b94d7751e8dfe1e140e318bdc845b53bb85468fcf335f4501033825bfb66')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
