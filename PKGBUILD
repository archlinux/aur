pkgname=pocketbase-bin
pkgver=0.39.1
pkgrel=1
pkgdesc='Open Source realtime backend in 1 file'
arch=(x86_64 aarch64 armv7h)
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
_src='https://github.com/pocketbase/pocketbase'
source_x86_64=("$_src/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
source_aarch64=("$_src/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_arm64.zip")
source_armv7h=("$_src/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('ac11631975148783a8fdd57f8278d86048549f0e023855758284340a34342e06')
sha256sums_aarch64=('acd78187a1f6aebc81be7e6302ccf5f5aa8bb5adc8263e43eb4fd9ed75302040')
sha256sums_armv7h=('feb05c57a21ae6a1fb24d5d2e4e80b8cfc0b9fb4e83c9cb777be81a6a26e8965')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
