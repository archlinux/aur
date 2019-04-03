# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=ttf-mph-2b-damase
pkgver=001.000.4.dfsg.2
_pkgver=001.000.dfsg.2+ds1
pkgrel=7
pkgdesc='Unicode font covering full plane 1, and numerous scripts'
url="http://packages.debian.org/unstable/x11/ttf-mph-2b-damase" 
license=('custom:Public_Domain')
arch=('any')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
source=("http://ftp.gnome.org/mirror/cdimage/snapshot/Debian/pool/main/t/${pkgname}/${pkgname}_${_pkgver}.orig.tar.gz")
sha1sums=('8663d937dabce9bebb9c46b6e985102d03830fd4')

install=install

package() {
	cd "${srcdir}/${pkgname}-${_pkgver}.orig"
	install -dm755 "${pkgdir}"/usr/share/{fonts/TTF,licenses/${pkgname}}
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF
	echo 'No copyright applies; this work is in the public domain.' > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
