# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=5.0.4
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk2>=2.8.0' 'webkitgtk2' 'libxtst')
source_i686=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_i386.deb")
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_i686=('0c3456a4fbef950fa25acc2f90110fd35b5bf6934a493fc50afeac7f27c5ca081cd36d8da9b28eb402c1cd924fd6c55d8683d086652b97d7126f26ef4978ee57')
sha512sums_x86_64=('9a51b8fad29c312799f745f4564a4186570085277bd21b9a1dffe6440fa42b9a1947fca024edd17340a2a420d77c15c9b6888bb08e65a08a76b5def987b49e08')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
