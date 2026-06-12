# Maintainer: Lev <levpr1c@proton.me>

pkgname=psychotests-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='TUI psychological testing application (9 tests)'
arch=('x86_64')
url='https://github.com/levpr1c/psychotests'
license=('custom:WTFPL')
depends=()
provides=('psychotests')
conflicts=('psychotests')
source=("psychotests-linux-x86_64::https://github.com/levpr1c/psychotests/releases/download/v$pkgver/psychotests-linux-x86_64")
sha256sums=('c26ec9eaee79707dd06f5b5d0362ff1104e49224ef774b8ad36548ebf9672b81')

package() {
  install -Dm755 "$srcdir/psychotests-linux-x86_64" "$pkgdir/usr/bin/psychotests"
}
