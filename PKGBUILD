# Maintainer: Koulmoir <lord.cheesev2@gmail.com>
pkgname=no-risk-client-bin
pkgver=0.6.9.beta.10
pkgrel=1
pkgdesc="NoRiskClient Launcher to install and launch Minecraft with several new features"
arch=('x86_64')
url=""norisk.gg""
license=('GPL')
groups=('NoRiskClient')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/NoRiskClient/noriskclient-launcher/releases/latest/download/NoRiskClient-Linux.deb")
sha512sums_x86_64=('638da484f8035b583df6923a004ed0c631d2ae2c7f3b8dd849224a98132a7035d95c48a50c4d7b18ab870f36fc24acf8731f2f4ba19382ddd06d8016fb0d784a')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
