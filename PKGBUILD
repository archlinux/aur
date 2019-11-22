# Maintainer: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>
pkgname=yacreader-bin
_pkgname=yacreader
pkgver=9.5.0
_rel=3.151
pkgrel=$_rel
pkgdesc='A comic reader for cross-platform reading and managing your digital comic collection.(using rpm package to speed up installation.) -'
arch=('x86_64')
url='http://www.yacreader.com'
license=('GPL3')
depends=('libunarr' 'qt5-base' 'qt5-multimedia' 'poppler-qt5')
provides=('yacreader' 'yacreader-nopdf')
conflicts=('yacreader' 'yacreader-nopdf')
replaces=('yacreader' 'yacreader-nopdf')
source=("https://download.opensuse.org/repositories/home:/selmf:/yacreader-rpm/Fedora_Rawhide/$arch/$_pkgname-$pkgver-$_rel.$arch.rpm")
sha256sums=('54cb749b9be711a9ea055a998142704bee7bd9d9eb497c0a1f741678a1334ac6')

package() {
    install -d ${pkgdir}/usr
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/man
	install -d ${pkgdir}/usr/share/doc
	
    cd "$srcdir"
    cp * -rf "$pkgdir"/.
}
