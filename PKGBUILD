# Maintainer: nemesys <nemstar zoho com>
# Contributor: Evan Penner <evaninrussia@gmail.com>

pkgname=fbsplash-theme-arch-black-extras
pkgver=1.3
pkgrel=1
pkgdesc='An Archlinux black fbsplash theme with extra resolution config files'
arch=('i686' 'x86_64')
#license='CCPL:cc-by-nc-sa'
url='http://www.opendesktop.org/content/show.php?content=118523'
depends=()
optdepends=('fbsplash: A userspace implementation of a splash screen for Linux')
source=("arch-black-${pkgver}-${pkgrel}.tar.gz::http://sourceshark.com/sourcecode/khotnewstuff/bootsplashs/downloads/118524-arch-black-extras.tar.xz")
install=${pkgname}.install
md5sums=('a8c4f48718a73943db16e3f0ee87eaba')

package() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/arch-black" .
}

