# Maintainer: birbkeks birbkeks@proton.me

_pkgname=klassy
pkgname=klassy-bin
pkgver=6.1.breeze6.0.3
pkgrel=1
pkgdesc="Highly customizable binary Window Decoration, Application Style and Global Theme plugin for recent versions of the KDE Plasma desktop."
arch=(x86_64)
url="https://github.com/paulmcauley/klassy"
license=('GPL-2.0-only AND GPL-3.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT')

depends=(frameworkintegration
		 gcc-libs
		 glibc
		 kcmutils
		 kcolorscheme
		 kconfig
		 kconfig5
		 kcoreaddons
		 kdecoration
		 kguiaddons
		 kguiaddons5
		 ki18n
		 kiconthemes
		 kirigami
		 kwidgetsaddons
		 kwindowsystem
		 qt6-base
		 qt6-declarative
		 qt6-svg
		 qt5-base
		 qt5-declarative
		 xdg-utils)
		 
makedepends=(extra-cmake-modules
			 kcmutils5
			 frameworkintegration5
			 kconfigwidgets5
			 kiconthemes5
			 kirigami2
			 kwindowsystem5)

provides=('klassy')
conflicts=('klassy')
replaces=(classik)

_source=("https://download.opensuse.org/repositories/home:/paul4us/Arch")
source=("${_source}/${arch}/${_pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('dc06809e7f3782b52291c23f73d88d66403a3316d3774471f4bf1fa8ae15a872')

options=(!debug)

package() {
	cp -r "${srcdir}/usr/" "${pkgdir}"
}
