# Maintainer: You <you@example.com>
pkgname=hapiness
pkgver=1.0.0
pkgrel=1
pkgdesc="If you have a fake smile install it"
arch=('any')
url="https://aur.archlinux.org/pkgbase/hapiness"
license=('MIT')
depends=('bash')
source=("$pkgname")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
