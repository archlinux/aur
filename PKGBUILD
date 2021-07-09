# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=pkgbuild-version-updater
pkgver=1.0.1
_pkgtag=$pkgver
pkgrel=2
pkgdesc="This script allows you to automatic update a large nummner of PKGBUILD files and push them to the aur, if only the pkgver and the checksum has been changed. As example this is very useful for gog games with many DLCs."
arch=('x86_64')
url="https://gitlab.com/Lukas1818/pkgbuild-version-updater"
license=('LGPL3')
depends=('git' 'coreutils' 'pacman' 'bash' 'openssh')
source=("https://gitlab.com/Lukas1818/pkgbuild-version-updater/-/archive/$_pkgtag/pkgbuild-version-updater-$_pkgtag.tar.gz")
sha512sums=('c51cc6866c3bcdd280ed4236ebebd4f8bd3cdcbbb428d0d75b54f807a022b430045adeca0178b9330c61938bb83db2b1ae5f51b883750b8339ef71c2f9fccddf')


package()
{
	install -Dm 755 "${srcdir}/pkgbuild-version-updater-$_pkgtag/pkgbuild-version-updater.sh" "${pkgdir}/usr/bin/pkgbuild-update"
}
