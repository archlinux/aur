# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=7.2.1
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('x86_64')
url="https://wireframesketcher.com"
_watch=('https://wireframesketcher.com/version')
license=('nonfree')
depends=('gtk3' 'webkit2gtk-4.1')
source_x86_64=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_amd64.deb")
sha512sums_x86_64=('295ad3cb60a7c5cac90d86d6b14e6ca0ee3a36807653b260273c42d479b4be9a48f978d15597b2a4903196f0e64a144cd82ac6eea22cb520831e2fe46163df0d')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
