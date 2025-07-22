# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=bjeps2xx
_pkgver=5100
pkgver=5.1
pkgrel=1
pkgdesc="Pacote de instalacao do Complemento Banrisul Internet Banking destinado ao sistema operacional Linux."
arch=('x86_64')
url="https://www.banrisul.com.br/bob/link/bobw00hn_conteudo_detalhe2.aspx?secao_id=3002"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.banrisul.com.br/bob/download/ComplementoBanrisulLinux_vsr${_pkgver}.deb")
sha512sums_x86_64=('4836646597a8a5b8c20868a9574521f0dd6ec3071f71e8a2e83bfb10511d105fe715175b72647792b388e1b70940a7def07bdb697bad407dcf337b7b98c7aa00')

package(){
	depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsm' 'libusb' 'libx11' 'openssl-1.1' 'pango' 'pcsclite' 'zlib')
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
