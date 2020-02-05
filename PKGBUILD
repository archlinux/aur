# Maintainer: Please see AUR package page for current maintainer(s) and contact information.

pkgname=atspkg
pkgver=3.4.0.9
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
sha512sums=('e4e66d8f5b226feed06d805cabc9c26dfb87c8f3d393d129dcaf3005ab59d5adcefed118f2c124b18b82f7401e82c7d68ab0b007ae92132f98b7604ae49e1790'
            'c9e067606a558dc915677dba75f10556c32c13bcf84bd1cf6e6839fdd0adacca4802182a2e540e5d88e64c2ad2f467a6a904f93dedf349979679b219898e57a3')
