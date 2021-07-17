# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Judah Brown <privacyprotect1234@outlook.com>
pkgname=daze
pkgver=v0.1.1a
pkgrel=2
pkgdesc="A declarative langauge for building websites."
arch=('any')
url="https://github.com/JTechnologies/Daze/"
license=('MIT')
depends=('python>3')
source=("daze")
noextract=("daze")
md5sums=("7d5c63405b44505f17ac7a676fc67b38")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/daze" "${pkgdir}/usr/bin/daze"
	chmod +x "${pkgdir}/usr/bin/daze"
}
