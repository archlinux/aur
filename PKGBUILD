# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=bjeps2xx
_pkgver=6100a
pkgver=6.1
pkgrel=2
pkgdesc="Pacote de instalacao do Complemento Banrisul Internet Banking destinado ao sistema operacional Linux."
arch=('x86_64')
url="https://www.banrisul.com.br/bob/site/link/complemento-internet-banking.html"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.banrisul.com.br/bob/site/link/midias/49309_ComplementoBanrisulLinux_vrs${_pkgver}.deb")
sha512sums_x86_64=('2d4de3016e6b96d2e59c448e2d480b7b6b0f97171694200a5b062187cb1a6f6105180f9303614b413ab6ba87c4c7adc60220e9a86649114411698f1e990a6a0e')

package(){
	depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsm' 'libusb' 'libx11' 'openssl-1.1' 'pango' 'pcsclite' 'zlib')
	optdepends=('ccid' 'pcsc-tools')
	# Extract package data
	tar --zstd -xf data.tar.xz -C "${pkgdir}"
}
