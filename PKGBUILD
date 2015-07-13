# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: erdnaxeli  <erdnaxeli@gmail.com>
pkgname=fortune-mod-multidesk
pkgver=20140622
pkgrel=1
pkgdesc='Fortune cookies: Jayce about his OS, MultiDeskOS.'
url='http://lordoric.free.fr'
arch=('any')
license=('custom:PublicDomain')
depends=('fortune-mod')
groups=('fortune-mods')

source=('multidesk')
md5sums=('a2c437db52dee4163ebf302e2fd6b522')

build() {
    strfile ${srcdir}/multidesk
}

package(){
    install -D -m644 ${srcdir}/multidesk ${pkgdir}/usr/share/fortune/multidesk
    install -D -m644 ${srcdir}/multidesk.dat ${pkgdir}/usr/share/fortune/multidesk.dat
}
