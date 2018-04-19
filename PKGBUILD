# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=atspkg
pkgver=2.10.0.10
pkgrel=1
pkgdesc="Build tool for ATS language."
arch=('x86_64')
url="https://github.com/vmchale/atspkg"
license=('bsd3')
depends=('ats2-postiats')
_baseurl=https://github.com/vmchale/atspkg/releases/download/
source=("${_baseurl}${pkgver}"/atspkg-"$CARCH"-unknown-linux
	"${_baseurl}${pkgver}"/atspkg.1)

package() {
	cd "$srcdir"

	install -Dm0755 "${srcdir}/atspkg-${CARCH}-unknown-linux" "${pkgdir}/usr/bin/atspkg"
	install -Dm0644 "${srcdir}/atspkg.1" "${pkgdir}/usr/share/man/man1/atspkg.1"
}
sha512sums=('10a3531d5005dbc8affaf28bd1eb6de55f1d9537470b6e34a2e820dac22cf8652ae6ce974e28e709391db2e5ec455ed787ce7fb0e2a8506c345f13eeea91c2fc'
            '6366d67ee85fce8488c88a87982d0731dc4b14988c1179f1dff4261e99f3a4fd7a21142fff1193b5709c620846428b6531beabbfcc6fa867cd5407f8f146b259')
