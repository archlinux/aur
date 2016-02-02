# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=4.5.2
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('java-runtime' 'gtk2>=2.8.0' 'webkitgtk2' 'libxtst')
source_i686=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_i386.deb")
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_i686=('527ac206bff8bfe70d3b119996a4ddaff0f08138856e322ee3a671a125a7b3501f3720a8c3df5ea37197362ac8e15df41c9ebb85a2e041dc957a7a3c7711338f')
sha512sums_x86_64=('e4fd27a754ebe2eca6f772d099912ad15a06004d12460926fc96e1993ac84affe88fc92cb237ee98cf5a7c72c437512a89c53f5365020fab8c7d41b9bf288730')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
