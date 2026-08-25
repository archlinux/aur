pkgname=pocketbase-bin
pkgver=0.40.1
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
sha256sums_x86_64=('0f3442d2e57b03b56fbff0d09289e4a30b4f561a44338c38d2dcd4a1a0cfa91e')
sha256sums_aarch64=('8e15eb6080de5ae7fcf789ac963d5c3c9328a491d5f7a24eb13c93a2f4bae4f1')
sha256sums_armv7h=('7769f7c696284083b333823746a9534804a52a10ca12e5c97ae7af0ea32568c3')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
