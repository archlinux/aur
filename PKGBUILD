# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

_pkgname=gradio
pkgname=gradio-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="A GTK3 app for finding and listening to internet radio 
stations."
arch=("x86_64" "i386")
url="https://github.com/haecker-felix/gradio"
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'json-glib' 'libgee' 
'libsoup')
conflicts=('gradio-git')
noextract=("$pkgname_$pkgver*.deb")
source_x86_64=("https://github.com/haecker-felix/gradio/releases/download/v4.0.0/${_pkgname}_${pkgver}.r105-0.ubuntu16.04.1_amd64.deb")
source_i686=("https://github.com/haecker-felix/gradio/releases/download/v4.0.0/${_pkgname}_${pkgver}.r105-0.ubuntu16.04.1_i386.deb")
md5sums_x86_64=('f544f691f6b7b821e0b6e3f8379abff9')
md5sums_i686=('c5d8b9465d7d4c82bb86171aa77aebf2')

package() {
	dpkg-deb -x $srcdir/${_pkgname}_${pkgver}*.deb $pkgdir/
}

