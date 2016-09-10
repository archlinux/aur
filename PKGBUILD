# Gaku maintainer: Johan Sageryd <j@1616.se>
# AUR Maintainer: Raansu <Gero3977@gmail.com>

pkgname=gaku
pkgver=1.2.0
pkgrel=1
pkgdesc="A experimental command line based spaced repetition software (SRS) Installs to /opt"
arch=('i686' 'x86_64')
url="https://github.com/jsageryd/gaku"
license=('MIT')
depends=('ruby=>1.9')
provides=('gaku')
conflicts=('gaku')
source=("https://github.com/jsageryd/gaku/archive/v${pkgver}.tar.gz")
sha256sums=('edd6f436f949a97207dbe5204d853ec14be78a9eeb64b48b574a95ce76c9779c')

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	cd "${srcdir}"
	cp -r "${pkgname}-${pkgver}" $pkgdir/opt
	ln -s "/opt/${pkgname}-${pkgver}/bin/gaku" "$pkgdir/usr/bin/gaku"
}