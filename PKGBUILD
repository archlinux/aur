# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=imsg-compat
pkgname=imsg-compat
pkgver=6.8.0
pkgrel=1
pkgdesc="linux port of OpenBSD imsg utilities"
url="https://github.com/bsd-ac/imsg-compat"
license=('ISC')
arch=('any')
source=( "${pkgname}-${pkgver}.tar.gz::https://github.com/bsd-ac/imsg-compat/archive/${pkgver}.tar.gz" )
md5sums=('34d66d1118f99eca32bc2ce006af4f83')

compile() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

#vim: syntax=sh
