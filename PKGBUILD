# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-chbox
pkgver=0.2.4
pkgrel=2
pkgdesc='This chbox plugin adds the convenient functionality of making single and/or multiple selections from a number of emails in Roundcube message list.'
arch=('any')
url='https://plugins.roundcube.net/packages/roundcube/chbox'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/6ec123321/chbox/archive/${pkgver}.tar.gz")
md5sums=('a647981b8b09d37a02401c9ccf0d5add')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/chbox-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/chbox"
}
