# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Judah Brown <privacyprotect1234@outlook.com>
pkgname=daze
pkgver=v0.2.0a
pkgrel=3
pkgdesc="A declarative langauge for building websites."
arch=('any')
url="https://github.com/JTechnologies/Daze/"
license=('MIT')
depends=('python>3')
source=("daze")
noextract=("daze")
md5sums=("c522d1cb9577c5c377fbe2524a5d9fe0")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/daze" "${pkgdir}/usr/bin/daze"
	chmod +x "${pkgdir}/usr/bin/daze"
}
