pkgname=pocketbase-bin
pkgver=0.40.3
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
sha256sums_x86_64=('8d81b6b79add0e219373e922ebe1dddbee7f57fcff602e3585e0d2c654b983ce')
sha256sums_aarch64=('d5092815259f5bc2dffabf6a71da2168851c8d75c04d6e56f6e7a38c48941c70')
sha256sums_armv7h=('011ac95eea8cb4139e4b00a667c55041a7245bcfa6b8cc4010a238c230d4487a')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
