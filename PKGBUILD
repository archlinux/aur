# Maintainer: deusstultus <0x574EDC8EE28E6872A2D9CC66939C852925E4A9F0>

pkgname=simploripsum
pkgver=0.1
pkgrel=1
pkgdesc="A simple cli interface for loripsum.net API"
arch=('any')
url="https://aur.archlinux.org/packages/simploripsum"
license=('GPL')
depends=('bash')

source=(simploripsum.sh{,.asc})
sha256sums=('1da5245c627e84734df4c91a9058a1a8a2d809b7653d7295ea5e1e09d384f19f'
            'SKIP')
validpgpkeys=('574EDC8EE28E6872A2D9CC66939C852925E4A9F0')

package() {
  install -D -m755 $srcdir/simploripsum.sh $pkgdir/usr/bin/simploripsum
}

# vim:set sw=2 ts=2 et:

