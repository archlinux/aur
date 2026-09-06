# Maintainer: yum13241 <coolcrew45 at disroot dot org>

pkgname=elyprismlauncher-bin
pkgver=11.1.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Prism Launcher fork with integrated support for Ely.by accounts (binary version)"
arch=('x86_64')
url="https://github.com/ElyPrismLauncher/Launcher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(glibc mesa-utils gcc-libs java-runtime libarchive libgl pciutils qrencode qt6-base qt6-imageformats qt6-networkauth qt6-svg zlib hicolor-icon-theme tomlplusplus cmark)
provides=('elyprismlauncher')
conflicts=('elyprismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/ElyPrismLauncher/Launcher/releases/download/${_pkgver}/PineconeMC-ArchLinux-${_pkgver}.pkg.tar.zst")
noextract=("PineconeMC-ArchLinux-${_pkgver}.pkg.tar.zst")
sha256sums=('SKIP')

package()
{
	mkdir ${pkgdir}/usr
	cd ${pkgdir}/usr
	tar -xvf ${srcdir}/PineconeMC-ArchLinux-${_pkgver}.pkg.tar.zst --strip-components=1
}
