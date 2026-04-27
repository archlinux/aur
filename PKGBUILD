pkgname=pocketbase-bin
pkgver=0.37.4
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
sha256sums_x86_64=('e6cb338e54329e328e4f42b999ac820901d2d23b7e7562417259b0ef882edf9c')
sha256sums_aarch64=('e6a6ca0ee3c2acc369dc6965d555760a66b3540c13ba863d28dbc2ec77d325f1')
sha256sums_armv7h=('372f84113cad5e6774e6eae0bedb8bc1d3fc7fa4528ac4615d45ddc40695f9b8')
package() {
  install -Dm755 "$srcdir/pocketbase" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
