# Maintainer: syrupderg <syrupderg at proton dot me>

_pkgname=klassy
pkgname=klassy-bin
pkgver=6.5.2
pkgrel=1
pkgdesc="Highly customizable binary Window Decoration, Application Style and Global Theme plugin for recent versions of the KDE Plasma desktop."
arch=(x86_64)
url="https://github.com/paulmcauley/klassy"
license=('GPL-2.0-only AND GPL-3.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT')

depends=(
	frameworkintegration
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
	xdg-utils
)

provides=('klassy')
conflicts=('klassy')
replaces=(classik)

source=("https://download.opensuse.org/repositories/home:/paulmcauley/Arch/${arch}/${_pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=('8d09248c7013e5e4a3c9c09794b3cfdb3aaede1d98e1c29acbb65e942f60a2e6')

options=(!debug)

package() {
	cp -r "${srcdir}/usr/" "${pkgdir}"
}
