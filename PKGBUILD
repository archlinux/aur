# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-cg-car-64-austin-mini
pkgver=BETA
pkgrel=2
pkgdesc='1964 Austin Mini MK1 car model for Racer (CG version) by Harey'
arch=('any')
license=(custom)
url='http://www.racedepartment.com/threads/1964-austin-mini-beta.62339/'
depends=('racer-cg')
makedepends=('unrar')
download="austin_mini.rar"
source=("https://yq2m2a-ch3301.files.1drv.com/y3m9GvQ5lwaezVuXCHzMAx5Vxheu0OPvdk5DwuL6tEUOxTXdMN3vd-OeopGFT_Dm0ubj9xDcJlbM122ue4ZDE3sEI8Z2xWWowlVqf0jyVozbmYgR4s0M8OaGi5xW9daGtT_/${download}")
md5sums=('9cb98afa2794612de4e532d750aee33c')
noextract=(${download})
package(){
	unrar x ${srcdir}/${download} ${srcdir}
	mv "$srcdir/README.txt" "$srcdir/austin_mini/"
	install -d -m755 "$pkgdir/opt/racer-cg/cars/"
	cp -dr "$srcdir/austin_mini" "$pkgdir/opt/racer-cg/cars/"
}
