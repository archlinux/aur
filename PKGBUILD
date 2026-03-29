pkgname=pocketbase-bin
pkgver=0.36.8
pkgrel=1
pkgdesc='Open Source realtime backend in 1 file'
arch=(x86_64 aarch64 armv7h)
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
source_x86_64=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_arm64.zip")
source_armv7h=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('6a2f4e2eeab80d765a248266e83c22889610eedab515dc6d3e31e549f0007d5c')
sha256sums_aarch64=('aed68199e2903fec081cbd648593a31fa48f93185349e47c93a36ab721b7c20b')
sha256sums_armv7h=('a5442b045d7a5c5cd1b13bbaccdf8b79c9fcb7f0f62df5a596d0dfab74d8cb1b')
package() {
  install -Dm755 "$srcdir/pocketbase" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
