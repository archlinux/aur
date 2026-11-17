pkgname=pocketbase-bin
pkgver=0.42.3
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
sha256sums_x86_64=('89b1ded352404c648dd92c2d884fc8ff7858138697cb1ccb52722ccaa0bbd2a9')
sha256sums_aarch64=('f2af25259c5565e856aac5907a8fd9a7ce01d18375ac70b18121c9d41fd56dbe')
sha256sums_armv7h=('19e3f845e11fda810f07614edf24fbe1f3f3291d3814a564e100aecfe03d75e3')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
