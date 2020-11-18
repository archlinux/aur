# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=pkgbuild-version-updater
pkgver=0.1.0
_pkgtag=$pkgver
pkgrel=1
pkgdesc="This script allows you to automatic update a large nummner of PKGBUILD files and push them to the aur, if only the pkgver and the checksum has been changed. As example this is very useful for gog games with many DLCs."
arch=('x86_64')
url="https://gitlab.com/Lukas1818/pkgbuild-version-updater"
license=('LGPL3')
depends=('git' 'coreutils' 'pacman' 'bash')
source=("https://gitlab.com/Lukas1818/pkgbuild-version-updater/-/archive/$_pkgtag/pkgbuild-version-updater-$_pkgtag.tar.gz")
sha512sums=('58a4c2d1f673d85c8bd7f0872e381621779dc210c360ef9b37215c5c85f9d1376cf88af8f4bece113ac48fe0660ef520b9e3bc56e77e0074d90b7b2ac1b7f96a')


package()
{
	install -Dm 755 "${srcdir}/pkgbuild-version-updater-$_pkgtag/pkgbuild-version-updater.sh" "${pkgdir}/usr/bin/pkgbuild-update"
}
