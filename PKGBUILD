# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=4.6.2
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('java-runtime' 'gtk2>=2.8.0' 'webkitgtk2' 'libxtst')
source_i686=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_i386.deb")
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_i686=('8b497f3c4eb04d498c82aabe187631c553a05e56ba585f701750c82c776dcaec549a3c1168676dea4b799b2c04ea282f235e52348e6b4d949b76b47cf731da5b')
sha512sums_x86_64=('472a5eef70f43999ca237df9a5306f10471a3faf306415b98d6163dd4ef9f8b457134cd0fe033e4d93965cbfdf71231ce3f8d420e9188b1829be2f81cc6a11de')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
