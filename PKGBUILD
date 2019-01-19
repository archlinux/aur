# Maintainer: HRKo <ootaharuki99[at]gmail.com>
pkgname='deadbeef-plugin-jack'
pkgver=20190119+62d1e6a
pkgrel=1
pkgdesc='Jack output plugin for the DeaDBeeF music player.'
arch=('x86_64')
url="http://deadbeef.sourceforge.net/plugins.html"
license=('MIT')
depends=('deadbeef')
source=('http://sourceforge.net/projects/deadbeef/files/plugins/x86_64/jack-62d1e6a-x86_64.zip')
md5sums=('c61836e55ab525cdb731771c16acdb5b')

package() {
    install -D -m755 ${srcdir}/plugins/jack.so ${pkgdir}/usr/lib/deadbeef/jack.so
}
