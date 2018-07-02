# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-thedot
pkgver=0.4
pkgrel=1
pkgdesc="A mouse theme with circles (fork of the unmaintained original)"
arch=('any')
url="https://www.gnome-look.org/p/1244392/"
license=('GPL')
depends=()

source=("https://bitbucket.org/sergiy_ilchuk/thedot/get/0362c13478d3.zip"
	"thedot.patch")
md5sums=('7261bce54d3a96ff23346dfd6f16f33f'
         'b0b7d259448ac0ee8ce2d18c8d49eec9')

prepare() {
cd ${srcdir}/sergiy_ilchuk-thedot-0362c13478d3/
patch -Np1 -i ../thedot.patch
}

package() {
cd ${srcdir}/sergiy_ilchuk-thedot-0362c13478d3/
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR Dot-{Dark,Light} ${pkgdir}/usr/share/icons/
}


