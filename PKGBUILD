# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=6.1.0
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk3' 'webkit2gtk')
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_x86_64=('38818fa0ac4e4961f8284ee643ee03f857020f5484660aef6ace4260261723b75c18886ceb9af1bc73578ad5e0a198ba020f5077c58a8995e8af8d32f0167e30')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
