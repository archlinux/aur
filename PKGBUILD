# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('6993c241f0a06a3c938ce373abb83010cbd167f82d341190720db82b48756e2b5b061d2a6aa2d9a2282d96671219bb5eed6e0100216b3feadcc712250bd1de88')
b2sums_aarch64=('6993c241f0a06a3c938ce373abb83010cbd167f82d341190720db82b48756e2b5b061d2a6aa2d9a2282d96671219bb5eed6e0100216b3feadcc712250bd1de88')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-v$pkgver" "$pkgdir/usr/bin/drtl"
}
