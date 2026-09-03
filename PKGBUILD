pkgname=pocketbase-bin
pkgver=0.40.2
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
sha256sums_x86_64=('dd86b424a07f2bb5ac2b8ba8cdf013a37400a9cf56bd1f92e560981f7dd24244')
sha256sums_aarch64=('5746a6ff9bcd88022e44108d61e3f72508d41164915201a7641137683b9416f0')
sha256sums_armv7h=('14f1127ec4cf9b82522bb8ed72c7a9d90ef2e6bbeb6b30fb9c8eadd79865c6d9')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
