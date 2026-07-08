pkgname=pocketbase-bin
pkgver=0.39.6
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
sha256sums_x86_64=('9251d4ebca4fe91771392dc389a6e449e4e00a34182b0316e7a2d9984d34da3d')
sha256sums_aarch64=('1787ec2de1821f9464d835ccede697603d45eabe9078c3a4209442b3c6f7d18b')
sha256sums_armv7h=('3d78d792f04993cc453c6995c471e66494cc3237ed2a024590dd8e4b00a5fdd4')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
