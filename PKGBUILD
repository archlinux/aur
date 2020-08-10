# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-chbox
pkgver=1.3.7
pkgrel=1
pkgdesc='This chbox plugin adds the convenient functionality of making single and/or multiple selections from a number of emails in Roundcube message list.'
arch=('any')
url='https://plugins.roundcube.net/packages/roundcube/chbox'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/6ec123321/chbox/archive/chbox-${pkgver}.tar.gz")
md5sums=('4457db89d720203364a527e58fc8aa2d')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/chbox-chbox-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/chbox"
}
