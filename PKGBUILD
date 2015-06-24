# Maintainer: Evan Penner <evaninrussia@gmail.com>

pkgname=fbsplash-theme-arch-black
pkgver=1.3
pkgrel=1
pkgdesc='An Archlinux black fbsplash theme'
arch=('i686' 'x86_64')
license='CCPL:cc-by-nc-sa'
url='http://www.opendesktop.org/content/show.php?content=118523'
depends=()
optdepends=('fbsplash: A userspace implementation of a splash screen for Linux')
source=("arch-black-${pkgver}-${pkgrel}.tar.gz::http://www.opendesktop.org/CONTENT/content-files/118523-arch-black.tar.gz")
install=${pkgname}.install
md5sums=('dd9b9f564d733039fc828d6958245f73')

package() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/arch-black" .
}
