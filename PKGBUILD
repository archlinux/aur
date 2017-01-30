# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

_pkgname=gradio
pkgname=gradio-bin
pkgver=5.0.1
pkgrel=2
pkgdesc="A GTK3 app for finding and listening to internet radio 
stations, Binary."
arch=("x86_64" "i386")
url="https://github.com/haecker-felix/gradio"
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'json-glib' 'libgee' 
'libsoup')
conflicts=("gradio-git" "gradio")
noextract=("$pkgname_$pkgver*.deb")
source_x86_64=("http://ppa.launchpad.net/haecker-felix/gradio-daily/ubuntu/pool/main/g/gradio/gradio_5.0.12+r344-0~ubuntu16.04.1_amd64.deb")
source_i686=("http://ppa.launchpad.net/haecker-felix/gradio-daily/ubuntu/pool/main/g/gradio/gradio_5.0.12+r344-0~ubuntu16.04.1_i386.deb")
sha512sums_x86_64=('bcaec65546cd2cab911f9f9bacd9743e46e7a074e0e9e073602eecd32ecbea9b7c10bb1ec92bf96f2216540800325bf515698e5fb7f11d6df9052647052930a5')
sha512sums_i686=('6b82c34ad11f0dcb8404e0abf8a98f8892ce3c43c2eba267a9718161e56c2be8a36bbd29dca62913555220d76326d72142af3b4d0c91f45b97d20063a026689b')

package() {
	bsdtar -Oxf $srcdir/${_pkgname}_${pkgver}*.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
}

