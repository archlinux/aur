# Submitter: Timo Sarawinski <timo@it-kraut.net>

pkgname=roundcubemail-plugin-showfoldersize
pkgver=0.7.20
pkgrel=1
pkgdesc='A Roundcube plugin which shows folder size.'
arch=('any')
url='https://plugins.roundcube.net/packages/johndoh/showfoldersize'
license=('GPL3')
depends=('roundcubemail')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jfcherng-roundcube/plugin-show-folder-size/archive/${pkgver}.tar.gz")
md5sums=('918e52b53b4a380674b73a2c430908d3')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/plugin-show-folder-size-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/show_folder_size"
}
