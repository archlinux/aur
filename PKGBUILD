# Maintainer: Monsieur Tino <waste@mrtino.eu>

pkgname=(screencloud-bin)
pkgver=1.3.0
pkgrel=1
pkgdesc="Easy to use screenshot sharing application. Binary version."
arch=('x86_64')
url="https://github.com/olav-st/screencloud"
license=('GPL2')
depends=('pythonqt-for-screencloud' 'quazip' 'qt5-x11extras' 'xdg-utils' 'hicolor-icon-theme')
conflicts=('screencloud' 'screencloud-git')

source_x86_64=('https://download.opensuse.org/repositories/home:/olav-st/Debian_9.0/amd64/screencloud_1.3.0-1qt5_amd64.deb')
sha256sums_x86_64=('fb4c2263d38af6e14fdf0074dc6c1b147584246ff73a827376b8e3ceb370ab5a')

package() {
        cd "${srcdir}"

        tar -xf data.tar.xz -C "${pkgdir}"
}
