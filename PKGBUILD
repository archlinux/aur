# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('80b52b8649986a7540a967df390c82877880ba919997d8c4fbbc7ad647c7a1ec3a48f702b9d2a9154b51e14d2378aa3fedc71e430806b40afa2954af6aa6d9d2')
b2sums_aarch64=('80b52b8649986a7540a967df390c82877880ba919997d8c4fbbc7ad647c7a1ec3a48f702b9d2a9154b51e14d2378aa3fedc71e430806b40afa2954af6aa6d9d2')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-v$pkgver" "$pkgdir/usr/bin/drtl"
}
