# Maintainer: syrupderg <syrupderg at proton dot me>

pkgname=win11-sddm-theme
pkgver=1.0
pkgrel=1
pkgdesc="Windows 11 login screen theme for SDDM."
arch=(x86_64)
url="https://github.com/syrupderg/win11-sddm-theme"
license=('MIT')

depends=(
	sddm
	qt5-declarative
	qt6-5compat
	qt6-base
	qt6-declarative
	qt6-multimedia
	qt6-multimedia-ffmpeg
	qt6-shadertools
	qt6-svg
	qt6-translations
	qt6-virtualkeyboard
)

provides=('win11-sddm-theme')

source=("${url}/releases/download/${pkgver}/${pkgname}.tar.gz")
md5sums=('SKIP')

options=(!debug)

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/"
	cp -r ${pkgname}/ "${pkgdir}/usr/share/sddm/themes/"
}

