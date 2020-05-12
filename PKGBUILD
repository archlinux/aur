# Submitter: Timo Sarawinski <timo@it-kraut.net>

pkgname=roundcubemail-plugin-showfoldersize
pkgver=0.6.4
pkgrel=2
pkgdesc='A Roundcube plugin which shows folder size.'
arch=('any')
url='https://plugins.roundcube.net/packages/johndoh/showfoldersize'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/jfcherng-roundcube/plugin-show-folder-size/archive/${pkgver}.tar.gz")
md5sums=('7f4135752dd3f46720b1c4583d6ee67e')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/plugin-show-folder-size-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/show_folder_size"
}
