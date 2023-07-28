# Maintainer: tioguda <tioguda@gmail.com>

pkgname=bjeps2xx
_pkgver=5000
pkgver=4.0
pkgrel=1
pkgdesc="Pacote de instalacao do Complemento Banrisul Internet Banking destinado ao sistema operacional Linux."
arch=('x86_64')
url="https://www.banrisul.com.br/bob/link/bobw00hn_conteudo_detalhe2.aspx?secao_id=3002"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.banrisul.com.br/bob/download/ComplementoBanrisulLinux_vsr${_pkgver}.deb")
sha512sums_x86_64=('0481ab68157571cb06ecce08245fefbdc163045349c4920c3e521a470ddb8a5c418eeefa51d43de98d1a71196a6bdf8297abd3526c72ae0cf3ec09d8764c0af6')

package(){
	depends=('cairo' 'gcc-libs' 'gdk-pixbuf' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsm' 'libusb' 'libx11' 'openssl-1.1' 'pango' 'pcsclite' 'zlib')
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
