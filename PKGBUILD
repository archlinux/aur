# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=bjeps2xx
_pkgver=6100
pkgver=6.1
pkgrel=1
pkgdesc="Pacote de instalacao do Complemento Banrisul Internet Banking destinado ao sistema operacional Linux."
arch=('x86_64')
url="https://www.banrisul.com.br/bob/site/link/complemento-internet-banking.html"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.banrisul.com.br/bob/site/link/midias/49309_ComplementoBanrisulLinux_vrs${_pkgver}.deb")
sha512sums_x86_64=('452f37970ec81886b3e75436f97bc36bca4265610a828ac97a92d3890ab389a932a625d4e0939626ff33a1108055fa47ba13a7f6d0abc35c5601d6e101e1a06a')

package(){
	depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsm' 'libusb' 'libx11' 'openssl-1.1' 'pango' 'pcsclite' 'zlib')
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
