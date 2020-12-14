# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=pkgbuild-version-updater
pkgver=1.0.0
_pkgtag=$pkgver
pkgrel=2
pkgdesc="This script allows you to automatic update a large nummner of PKGBUILD files and push them to the aur, if only the pkgver and the checksum has been changed. As example this is very useful for gog games with many DLCs."
arch=('x86_64')
url="https://gitlab.com/Lukas1818/pkgbuild-version-updater"
license=('LGPL3')
depends=('git' 'coreutils' 'pacman' 'bash' 'openssh')
source=("https://gitlab.com/Lukas1818/pkgbuild-version-updater/-/archive/$_pkgtag/pkgbuild-version-updater-$_pkgtag.tar.gz")
sha512sums=('76dab0538f24271de9b51f03233796176a4fdf928cbf066b39853a7db5c63b9d4bcd7376f98237d868f0fa79e511c13f68d1cf7c71f82c5aeb6ab391c145d4ca')


package()
{
	install -Dm 755 "${srcdir}/pkgbuild-version-updater-$_pkgtag/pkgbuild-version-updater.sh" "${pkgdir}/usr/bin/pkgbuild-update"
}
