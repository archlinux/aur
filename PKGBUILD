# Gaku maintainer: Johan Sageryd <j@1616.se>
# AUR Maintainer: Raansu <Gero3977@gmail.com>

pkgname=gaku
pkgver=1.2.1
pkgrel=1
pkgdesc="A experimental command line based spaced repetition software (SRS) Installs to /opt"
arch=('i686' 'x86_64')
url="https://github.com/jsageryd/gaku"
license=('MIT')
depends=('ruby>=1.9')
provides=('gaku')
conflicts=('gaku')
source=("https://github.com/jsageryd/gaku/archive/v${pkgver}.tar.gz")
sha256sums=('a94e45293ad9f923904f7f04c7056f80bed89135c65d2a033cb06eabaf8c1978')

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	cd "${srcdir}"
	cp -r "${pkgname}-${pkgver}" $pkgdir/opt
	ln -s "/opt/${pkgname}-${pkgver}/bin/gaku" "$pkgdir/usr/bin/gaku"
}
