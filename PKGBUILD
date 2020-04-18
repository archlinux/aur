# Maintainer: Tristan Hill <tristan [at] me [dot] uk [dot] uk [dot] org>

pkgname=roundcubemail-plugin-delete_old
pkgver=1.0.2
pkgrel=1
pkgdesc='A Roundcube plugin to delete messages older than configurable timespans. '
arch=('any')
url='https://github.com/ron4mac/roundcube_delete_old'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/ron4mac/roundcube_delete_old/releases/download/v${pkgver}/delete_old.${pkgver}.zip")
sha256sums=('249438b70593d88cdc5cf456e7d00d43109d1c9a18e9042265a85ac4ca300c87')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/delete_old" "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
}

