pkgname=pocketbase-bin
pkgver=0.39.10
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
sha256sums_x86_64=('67f68c8041dbb6a35fd7af5997ffc5063a7a7b96bf9df810360788f9e9975408')
sha256sums_aarch64=('5bad497eaf2522418673eacfcc90e75106036f19b4aeeac6e59bc48503c01ddf')
sha256sums_armv7h=('6845a91fe31867b76abc3d598a5d33ac1cb3e77a3c0d51b6fb6184ddd28b6435')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
