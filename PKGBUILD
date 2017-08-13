# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-markasjunk2
pkgver=1.11.1
pkgrel=1
pkgdesc='Learn messages as Junk/Not Junk.  (With support for external learn commands.)'
arch=('any')
url='https://plugins.roundcube.net/packages/johndoh/markasjunk2'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/JohnDoh/Roundcube-Plugin-Mark-as-Junk-2/archive/${pkgver}.tar.gz")
md5sums=('c0f6ca00e67d91a767eafc1d67944f4f')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Mark-as-Junk-2-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/markasjunk2"
}
