# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-chbox
pkgver=0.2.4
pkgrel=1
pkgdesc='This chbox plugin adds the convenient functionality of making single and/or multiple selections from a number of emails in Roundcube message list.'
arch=('any')
url='https://plugins.roundcube.net/packages/roundcube/chbox'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/6ec123321/chbox/archive/${pkgver}.tar.gz")
md5sums=('7d55fa4601e6d5380855d39d35394048')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/chbox-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/chbox"
}
