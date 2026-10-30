pkgname=pocketbase-bin
pkgver=0.41.1
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
sha256sums_x86_64=('7504ec99a85fe405fc9941b4d94bdea20733b53707c8251b66fd0daa1444347e')
sha256sums_aarch64=('341a249f97f4ff1ba8dfff81d357eb281cd346fbddae8b6ea43193f0647e036d')
sha256sums_armv7h=('c04fd7d05323efdb0c7a55e46e4aa0e8f69203b10604d17e350b30c6e5528ec9')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
