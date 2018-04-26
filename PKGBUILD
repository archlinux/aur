# Maintainer: deusstultus <0x574EDC8EE28E6872A2D9CC66939C852925E4A9F0>

pkgname=simploripsum
pkgver=0.2
pkgrel=1
pkgdesc="A simple cli interface for loripsum.net lorem ipsum API"
arch=('any')
url="https://aur.archlinux.org/packages/simploripsum"
license=('GPL')
depends=('bash')

source=(simploripsum.sh{,.asc})
sha256sums=('a5273ab764a7ad7f2fd276bd2179b112dbe836c92acb46244c98b96a0b0f54ee'
            'SKIP')
validpgpkeys=('574EDC8EE28E6872A2D9CC66939C852925E4A9F0')

package() {
  install -D -m755 $srcdir/simploripsum.sh $pkgdir/usr/bin/simploripsum
}

# vim:set sw=2 ts=2 et:

