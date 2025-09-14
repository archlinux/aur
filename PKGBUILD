# Maintainer: fossdd <fossdd@pwned.life>

pkgname=swaydim
pkgver=1
pkgrel=3
pkgdesc="Dims your display using brightnessctl"
arch=('any')
url="https://codeberg.org/achill/swaydim"
license=('Unlicense')
depends=('python' 'brightnessctl')
makedepends=('git')
source=("git+$url?tag=$pkgver")
md5sums=('SKIP')

package() {
	install -Dm755 "$srcdir/$pkgname/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
