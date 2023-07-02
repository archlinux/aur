# Maintainer: CallMeEchoCodes <romanbarrettsarpi@pm.me>
pkgname=fetcho
pkgver=1.1.0
pkgrel=2
pkgdesc='A simple fetch made in C++'
arch=('any')
url="https://github.com/CallMeEchoCodes/fetcho"
license=('MPL-2.0')
provides=( fetcho )
depends=('libprocps')
source=("fetcho::git+${url}.git#tag=v$pkgver")
package() {
   install -Dm755 "$srcdir/fetcho/build/release/bin/fetcho" "$pkgdir/usr/bin/fetcho"
}
build() {
   make RELEASE=1 -C "$srcdir/fetcho" build
}
sha256sums=('SKIP')
