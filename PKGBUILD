pkgname=pocketbase-bin
pkgver=0.39.3
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
sha256sums_x86_64=('4a714b9f7188942721330883c424ad02ed9a313e74f430ad0374ca26aa603afd')
sha256sums_aarch64=('7411ddcffb8cce399c1307f88a40abdbcebdc7af138781d52487e411a60e537c')
sha256sums_armv7h=('2459a10f2def8e8f2735df388507a0ab9599e013e9f4a6bbdcba6aa31723c590')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
