# Maintainer: Koulmoir <lord.cheesev2@gmail.com>
pkgname=no-risk-client-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="NoRiskClient Launcher to install and launch Minecraft with several new features"
arch=('x86_64')
url=""norisk.gg""
license=('GPL')
groups=('NoRiskClient')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v${pkgver}/NoRiskClient-Linux.deb")
sha512sums_x86_64=('18378591ff3c4381614638a3c4cf3eb5e726d8a21120132085233eddd755487cfc96451da1af5ea60b80c50b60cc58f0fcdb008a14a0365a7f1838581dd5e851')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
