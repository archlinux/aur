pkgname=pocketbase-bin
pkgver=0.40.0
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
sha256sums_x86_64=('983740a4e5cc3b60c03d018c5a97ffe32ea560d6f55a53e2bca1ce3aae2cf8cb')
sha256sums_aarch64=('b63b7eb021d369679274e2430b9bf1397b62b1ce80dd6d426f4a8e7ac70238bb')
sha256sums_armv7h=('fb3689e27ee0dea5ad5fdf926015fb4a96e779e06cbf3db3a7d23c4a864d1149')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
