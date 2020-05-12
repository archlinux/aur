# Maintainer: Timo Sarawinski <timo [at] it-kraut [dot] net>

pkgname=roundcubemail-plugin-caldav_calendar
pkgver=0.7.0.0
pkgrel=1
pkgdesc='Caldav Calendar plugin for use with NextCloud.'
arch=('any')
url='https://github.com/texxasrulez/caldav_calendar'
license=('AGPL3')
conflicts=('roundcubemail-plugins-kolab')
depends=('roundcubemail' )
source=("https://github.com/texxasrulez/caldav_calendar/archive/${pkgver}.tar.gz")
sha256sums=('d48ecb1eef0b24b8e932aa953272838c1b131b34f9961e2b0ef608c57bc8ebde')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/caldav_calendar-${pkgver}/calendar" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/calendar"
    cp -r "${srcdir}/caldav_calendar-${pkgver}/libcalendaring" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/libcalendaring"
    cp -r "${srcdir}/caldav_calendar-${pkgver}/libkolab" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/libkolab"
}

