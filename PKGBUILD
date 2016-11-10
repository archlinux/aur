# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=4.7.1
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('java-runtime' 'gtk2>=2.8.0' 'webkitgtk2' 'libxtst')
source_i686=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_i386.deb")
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_i686=('f425e46ba7c722c4569f2a88569cd58dfc9b673fd4b4ad3ac6e983128d4aef75a6bc78ddc76cfaaa44a62010365a026a87c57dd037c3ecae43727ae8794a4853')
sha512sums_x86_64=('e4de8a6045405352bde587944aea2e83ab0d178ba7a3699599b0c4e0bf7de367700d8ceb49cf900c1c49a12c4c47ef11db308cb79bca6172ab2d77ac1ae17631')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
