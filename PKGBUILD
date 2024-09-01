# Maintainer: Koulmoir <lord.cheesev2@gmail.com>
pkgname=no-risk-client-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="NoRiskClient Launcher to install and launch Minecraft with several new features"
arch=('x86_64')
url=""norisk.gg""
license=('GPL')
groups=('NoRiskClient')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v${pkgver}/NoRiskClient-Linux.deb")
sha512sums_x86_64=('67d021b7cc7e943da36d444b05ff3b5b62a632256a81cb0632417264727f58d9c42b3c41ba7bd3267961e8e38fca53f2fc3acb4bcd85cb99ec7615e2320b39f5')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
