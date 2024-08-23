# Maintainer: fossdd <fossdd@pwned.life>

pkgname=swaydim
pkgver=1
pkgrel=2
pkgdesc="Dims your display using brightnessctl"
arch=('any')
url="https://codeberg.org/fossdd/swaydim"
license=('Unlicense')
depends=('python' 'brightnessctl')
makedepends=('git')
source=("git+$url?tag=$pkgver")
md5sums=('SKIP')

package() {
	install -Dm755 "$srcdir/$pkgname/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
