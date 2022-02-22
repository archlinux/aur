# Maintainer: nemesys <nemstar zoho com>
# Contributor: Evan Penner <evaninrussia@gmail.com>

pkgname=fbsplash-theme-arch-black-extras
pkgver=1.3
pkgrel=1
pkgdesc='An Archlinux black fbsplash theme with extra resolution config files and a config file generator within the theme folder /etc/splash/arch-black/arch-black-config-generator.'
arch=('i686' 'x86_64')
#license='CCPL:cc-by-nc-sa'
url='http://www.opendesktop.org/content/show.php?content=118523'
depends=()
optdepends=('fbsplash: A userspace implementation of a splash screen for Linux')
source=("arch-black-${pkgver}-${pkgrel}.tar.gz::https://cdn.kde.org/khotnewstuff/v1/bootsplashs/downloads/118524-arch-black-extras.tar.xz")
install=${pkgname}.install
md5sums=('a8c4f48718a73943db16e3f0ee87eaba')

package() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/arch-black" .
	cp -a "${srcdir}/fbsplash-theme-arch-black" ./arch-black/arch-black-config-generator
}

