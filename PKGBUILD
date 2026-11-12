pkgname=pocketbase-bin
pkgver=0.42.2
pkgrel=1
pkgdesc='Open Source realtime backend in 1 file'
arch=(x86_64 aarch64 armv7h)
url='https://pocketbase.io'
license=(MIT)
provides=(pocketbase)
conflicts=(pocketbase)
_src='https://ganigeorgiev.com/meta/pocketbase/pocketbase/download'
source_x86_64=("${_src}/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
source_aarch64=("${_src}/v${pkgver}/pocketbase_${pkgver}_linux_arm64.zip")
source_armv7h=("${_src}/v${pkgver}/pocketbase_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('a04d3a071c274b57c6592a65d1d03466ee11adf141ebb50bfcf9d986ead2026a')
sha256sums_aarch64=('b512d2ea90b4d64d30d0472761ee4853eded914f71ea8b3468d6334d0feedc3a')
sha256sums_armv7h=('265c88b4a8faeb2cefe89e4f8ee9a1e88b3e9f9f932d8562074048828c09a86a')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
