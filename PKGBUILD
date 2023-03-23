# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=6.6.1
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('x86_64')
url="https://wireframesketcher.com"
_watch=('https://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk3' 'webkit2gtk')
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_x86_64=('8df521b5b22061aacca40b73a790b58dc7c110d81158c9ff88d73eefd4c37e117b591fb0a38d2d290a9f9cb26746e941da00bdccaad399b01dac867388c035ab')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
