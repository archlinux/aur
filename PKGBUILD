pkgname=pocketbase-bin
pkgver=0.42.0
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
sha256sums_x86_64=('cd3439e7740e9b82e4ee947130ff3d1e7a66ef8d8bd219308fc1fa7b38bfdacc')
sha256sums_aarch64=('89cb6b8fff020bf905a7087576c341bd9b04d5a728ac2575b7d7ac50cdd93e7a')
sha256sums_armv7h=('3ca24e44738b8a0a8382e52c041f3de9f5f71a8d9824a49ac25421940d955688')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
