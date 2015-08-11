# Maintainer: Javier Tia <javier.tia@gmail.com>
pkgname=c
pkgver=0.10
pkgrel=1
pkgdesc='Compile and execute C "scripts" in one go!'
arch=('any')
url="https://github.com/ryanmjacobs/c"
license=('MIT')
provides=('c')
conflicts=('c')
source=('https://github.com/ryanmjacobs/c/archive/v0.10.tar.gz')
sha256sums=('958a2c2b2392b905cf39d75a3007adb47a818815a8485ca2170b4214233f6b14')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 775 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
