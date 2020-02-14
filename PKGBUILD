# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=buf-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers."
arch=('x86_64')
url="https://buf.build"
license=('Apache')
provides=('buf')
source=("https://github.com/bufbuild/buf/releases/download/v$pkgver/buf-Linux-x86_64.tar.gz")
sha256sums=('7fe0c2d1b958bc5d2434eaaac2e8278808dd22b7e595cbf2b97b0d23dd8e9d02')

package() {
  install -d -m755 "$pkgdir/usr"
  cp -ar "$srcdir/buf/bin" "$pkgdir/usr/bin"
  cp -ar "$srcdir/buf/etc" "$pkgdir/etc"
}
