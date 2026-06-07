pkgname=pocketbase-bin
pkgver=0.39.2
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
sha256sums_x86_64=('054cdf8c52712c4fcab1c515f0e4d9cc0e31d4f4f3bd81d8455b663178e2f146')
sha256sums_aarch64=('2816b8023f63c79ab12c8e74479c0e9c9795f2a6d4cf90400b8afcd338584636')
sha256sums_armv7h=('3221f33657f174bb7883efbe409bce13628ffb556860506c29269d0b902a411d')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
