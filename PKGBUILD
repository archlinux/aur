pkgname=pocketbase-bin
pkgver=0.37.2
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
sha256sums_x86_64=('920083c6380fe5552fbcc3262de3e24ee7713c2e20c7d3ebbbb19546efa17f86')
sha256sums_aarch64=('7ba91cd48c2b89b07df68491b9a9bb8cf3a25fe12f90183865b290af94ae8d74')
sha256sums_armv7h=('018d1cdd2d723b7a600599b82ef5a4d84c3cbe09b13389c9e3fd4b94086048b1')
package() {
  install -Dm755 "$srcdir/pocketbase" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
