# Submitter: Timo Sarawinski <timo@it-kraut.net>

pkgname=roundcubemail-plugin-showfoldersize
pkgver=0.7.19
pkgrel=1
pkgdesc='A Roundcube plugin which shows folder size.'
arch=('any')
url='https://plugins.roundcube.net/packages/johndoh/showfoldersize'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/jfcherng-roundcube/plugin-show-folder-size/archive/${pkgver}.tar.gz")
md5sums=('b20ef6849889fc6d5483eae8ee409539')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/plugin-show-folder-size-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/show_folder_size"
}
