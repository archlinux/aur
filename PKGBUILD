# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=6.4.1
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('x86_64')
url="https://wireframesketcher.com"
_watch=('https://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk3' 'webkit2gtk')
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_x86_64=('f6c14ec09e476562bfdeb6c2923fcb704fd6cc94cec50f4020d98d6a5eac4d91acafc582cc7081e711403d476db9dbe2ea16ba18e497d00ac02f3943829eb07f')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
