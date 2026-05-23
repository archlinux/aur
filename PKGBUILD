pkgname=pocketbase-bin
pkgver=0.38.2
pkgrel=1
pkgdesc='Open Source realtime backend in 1 file'
arch=(x86_64 aarch64 armv7h)
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
source_x86_64=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_arm64.zip")
source_armv7h=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('3749cf7e85b00027f3fb92494037e154aa023276246a101cd0592260b94ad1c3')
sha256sums_aarch64=('a621c816c27ac7d030bad63e280c4b0238f3c381974d043e130914498bf8a1e6')
sha256sums_armv7h=('ea0b6aee50150402e28ac7152f5fd6338713df16bd99f850b1b90ecfff618bff')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
