# Maintainer: Koulmoir <lord.cheesev2@gmail.com>
pkgname=no-risk-client-bin
pkgver=0.6.9
pkgrel=10
pkgdesc="NoRiskClient Launcher to install and launch Minecraft with several new features"
arch=('x86_64')
url=""norisk.gg""
license=('GPL')
groups=('NoRiskClient')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/NoRiskClient/noriskclient-launcher/releases/latest/download/NoRiskClient-Linux.deb")


package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
sha256sums_x86_64=('735a4008498be89d5c7bc8434a0b77041db506109cf17314a32528d75465c1fe')
