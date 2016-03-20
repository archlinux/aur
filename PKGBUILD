# Maintainer: Shebang <himself@stevenpolley.net>
#
_themename=stellar
pkgname=sddm-${_themename}-theme
pkgver=0.1
pkgrel=2
pkgdesc='A minimalistic sddm greeter theme that features a milky way background, credential panel, session and layout manager.'
arch=('any')
url='https://github.com/sgerbino'
license=('Copyright Steve Gerbino')
makedepends=('git')
depends=('sddm')

source=("${pkgname}"::"git://github.com/sgerbino/stellar.git")
md5sums=('SKIP')
install="${pkgname}.install"

package() {
	cd ${srcdir}
	msg2 "Installing theme..."
	mkdir -p ${pkgdir}/usr/share/sddm/themes
	cp -R ${pkgname} ${pkgdir}/usr/share/sddm/themes
}
