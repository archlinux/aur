# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

_pkgname=gradio
pkgname=gradio-bin
pkgver=4.0.1
pkgrel=2
pkgdesc="A GTK3 app for finding and listening to internet radio 
stations."
arch=("x86_64" "i386")
url="https://github.com/haecker-felix/gradio"
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'json-glib' 'libgee' 
'libsoup')
conflicts=("gradio-git" "gradio")
noextract=("$pkgname_$pkgver*.deb")
source_x86_64=("https://launchpad.net/~haecker-felix/+archive/ubuntu/${_pkgname}-daily/+files/${_pkgname}_${pkgver}+r109-0~ubuntu16.04.1_amd64.deb")
source_i686=("https://launchpad.net/~haecker-felix/+archive/ubuntu/${_pkgname}-daily/+files/${_pkgname}_${pkgver}+r109-0~ubuntu16.04.1_i386.deb")
md5sums_x86_64=('4cec328e0d57f0d9669178488c25b100')
md5sums_i686=('515ddee77009a029d9e64311c8826f62')

package() {
	bsdtar -Oxf $srcdir/${_pkgname}_${pkgver}*.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
}

