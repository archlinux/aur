# Maintainer: Ekin Dursun <ekindursun@gmail.com>

pkgname=spectrum
pkgver=1.0.5
pkgrel=1
pkgdesc="The community platform for the future."
arch=('x86_64')
url="https://spectrum.chat"
license=('BSD-3-Clause')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://github.com/withspectrum/spectrum/releases/download/v1.0.5/Spectrum_${pkgver}_amd64.deb" 'LICENSE')
sha512sums=('eedc7f60575c25d0d7f13f76bb20a68aa2afa2757d6c90828936327e1e8968495cb34ca026a40721161ed03a555be4bd915012c2d2768c138a8ff2169caa4260' 'ab4bee5a5b1746d8c0293bda9a45ffd54db15d827e0b72a4b5a815da04eec27f8f78ccdaa395553a7ac5d626032b8bd97d98f40fc57b185c667f6359ec1d638c')

package() {
    cd "${srcdir}"

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
