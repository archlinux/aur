pkgname=pocketbase-bin
pkgver=0.39.8
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
sha256sums_x86_64=('3b675575ff0e6dcc5befc85a9644aea6b04ac617ce125ecb2b6989a3c5b5664f')
sha256sums_aarch64=('d9e44e40f2483b468bb4dd64e12b554aa85941dc5ee9c4bb87aee8fa9e469425')
sha256sums_armv7h=('4824b6999c93227a2a544783e4007e57f43b72aac37f2aebbc99fe75055328b9')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
