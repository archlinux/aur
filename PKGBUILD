# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=jitterdebugger-bin
pkgver=r95.2657f15
pkgrel=1
pkgdesc="Real time response measurement tool (binary)"
arch=('x86_64')
url="https://github.com/igaw/jitterdebugger"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('jitterdebugger')
options=('!emptydirs')
changelog=
source=("file:///$pkgname-$pkgver.tar.gz")
sha256sums=('95504d95b9a6bef6f60ed4704b7f5125e2dc76322da066d99460f8913e2bc8d0')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "jitterdebugger.1" "$pkgdir/usr/share/man/man1/jitterdebugger.1"
  install -Dm755 "jitterdebugger" "$pkgdir/usr/bin/jitterdebugger"
}
