# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.19
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://codeberg.org/liya/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("yuki-iptv_${pkgver}_all.deb::$url/releases/download/$pkgver/yuki-iptv_${pkgver}_all.deb")
sha512sums=('9b01286c8ddd0079e56b89ab4f805ad935decf8f4213307227a2422e43e21e3db89aa4db8bf89d478caa158368cb3d7cad1453ad1cdb995fc533590e4e7fe8be')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
