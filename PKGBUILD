# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=shellharden
pkgver=3.0
pkgrel=1
pkgdesc='bash syntax highlighter'
arch=('x86_64')
url='https://github.com/anordal/shellharden'
license=('custom:missing')
depends=('rust')
source=("git+https://github.com/anordal/shellharden.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd shellharden

  rustc shellharden.rs
}

package() {
  cd shellharden

  install -Dm755 shellharden "$pkgdir/usr/bin/shellharden"
  #install -Dm644 LICENSE \
  #  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
