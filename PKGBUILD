pkgname=pocketbase-bin
pkgver=0.39.9
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
sha256sums_x86_64=('4c5a1aced62ebf658bfbcfeaa944c4bfa88b173dd9d598d3cab55ea63587b36b')
sha256sums_aarch64=('fd4138f29182288cbe6e9982e9f29b11df5f8e689c4f6a8f6cdf7aadd29d95a1')
sha256sums_armv7h=('8e0c58efe00c3d5e7ec3fda2c0f33ccfe924a64ee9e07915a19f951bcd084e60')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
