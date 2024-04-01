# Maintainer: fossdd <fossdd@pwned.life>

pkgname=swaydim
pkgver=1
pkgrel=1
pkgdesc="Dims your display using brightnessctl"
arch=('any')
url="https://aur.archlinux.org/packages/swaydim"
license=('Unlicense')
depends=('python' 'brightnessctl')
makedepends=('git')
source=("swaydim")
md5sums=('e899fdf800fc6dac8904e09028240717')

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
