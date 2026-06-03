# Maintainer: Yoftahe Abraham <jofab08@gmail.com>

pkgname=pkll-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Port process killer"
arch=('x86_64')
url="https://github.com/yofabr/pkll"
license=('MIT')  # Replace with actual license (e.g., 'MIT', 'GPL3')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.xz::https://github.com/yofabr/pkll/releases/download/v$pkgver/pkll-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('dad495873fe3d9391fc37be093f2a3e5594fc35cbb81d7f11243e4ba2a2c6f44')

package() {
  cd "$srcdir"
  install -Dm755 "pkll-$CARCH-unknown-linux-gnu/pkll" "$pkgdir/usr/bin/pkll"
  install -Dm644 "pkll-$CARCH-unknown-linux-gnu/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "pkll-$CARCH-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
