# Maintainer: HRKo <ootaharuki99[at]gmail.com>
pkgname='deadbeef-plugin-jack'
pkgver=20170604+62d1e6a
pkgrel=1
pkgdesc='Jack output plugin for the DeaDBeeF music player.'
arch=('x86_64')
url="http://deadbeef.sourceforge.net/plugins.html"
license=('MIT')
depends=('deadbeef')
source=('http://sourceforge.net/projects/deadbeef/files/plugins/x86_64/jack-62d1e6a-x86_64.zip')
md5sums=('08b3c08278556ab7b1ad344151d95ae3')

package() {
    install -D -m755 ${srcdir}/plugins/jack.so ${pkgdir}/usr/lib/deadbeef/jack.so
}
