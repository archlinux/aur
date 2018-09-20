# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=5.1.0
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk3' 'webkit2gtk')
source_i686=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_i386.deb")
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_i686=('5cac8d9b3b74a9d31643fb5824b324494e81fe0a8848151c10b02397fd9a18b9208a7c4b6483fa446bff12c77ba30e4b89a061d34d9bed234d3db922b1fd7c57')
sha512sums_x86_64=('c51aeb1791e6644c62dd0d61b14d725718c6def804c855417cfb9c07733c2f9bc0cb98932bcdfa1d18c6caf46691d7765592790d54d37441b4a76c541e28567c')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
