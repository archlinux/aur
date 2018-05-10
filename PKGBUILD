# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=5.0.3
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk2>=2.8.0' 'webkitgtk2' 'libxtst')
source_i686=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_i386.deb")
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_i686=('1e86082f16528d4affebbaea66a09db78753e3392b7e0bf63316edc66a341b41882ac8655355898b8df5d64126792b25e2b801012a9d74f7726dc684b2a4c3a4')
sha512sums_x86_64=('dfa85a5111f30431cd30c7b71e8b1489f365e1ea1be23f2c7c1b39161055cec063d041c8d28c54a9b426b360f6ebe873d8e4e1a71875188cee9a5c7212e2056c')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
