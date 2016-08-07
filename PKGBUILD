# $Id$
# Maintainer: Luis Henrique Mello <lmello.009@gmail.com>
# Contributor: Firmicus <francois@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=gsfonts-type1
_pkgname=urw-core35-fonts
pkgver=20150811
pkgrel=1
pkgdesc='URW+ Postscript core35 fonts - Type 1 Format'
url='http://git.ghostscript.com/?p=urw-core35-fonts.git'
arch=('any')
license=('AGPL3')
makedepends=('git')
depends=('xorg-font-utils' 'fontconfig')
provides=('gsfonts')
conflicts=('gsfonts')
source=("git://git.ghostscript.com/${_pkgname}.git#commit=c983ed400dc278dcf20bdff68252fad6d9db7af9")
sha1sums=('SKIP')

install=install

package() {
	cd "${srcdir}/${_pkgname}"
	install -d "${pkgdir}"/usr/share/fonts/Type1
	install -m644 *.{pfb,pfm,afm} "${pkgdir}"/usr/share/fonts/Type1
}
