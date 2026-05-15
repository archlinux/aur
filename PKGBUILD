pkgname=pocketbase-bin
pkgver=0.38.1
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
sha256sums_x86_64=('aef37fd0dac37885aa5d2523ca246e50a6c8e2917156ad14a896531d3d50bd2c')
sha256sums_aarch64=('1602b1141171983efde0aa79eaac5e382e2654c81e6df76af274e74de099a3a4')
sha256sums_armv7h=('9d09728a70af38531f1c895d1e38ff2cfb97b72cb46ff395fa089438f6393bd7')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
