# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-markasjunk2
pkgver=1.9
pkgrel=1
pkgdesc='Learn messages as Junk/Not Junk.  (With support for external learn commands.)'
arch=('any')
url='https://plugins.roundcube.net/packages/johndoh/markasjunk2'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/JohnDoh/Roundcube-Plugin-Mark-as-Junk-2/archive/${pkgver}.tar.gz")
md5sums=('e50080db30c4273139cdea1fb6ba96f9')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Mark-as-Junk-2-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/markasjunk2"
}
