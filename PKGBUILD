# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.12
pkgrel=2
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://codeberg.org/liya/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("yuki-iptv_${pkgver}_all.deb::$url/releases/download/$pkgver/yuki-iptv_${pkgver}_all.deb")
sha512sums=('ae272269d0abec16a14dc5aed5fd2373a7637dcb86911ba8c2b39425e932385b0ad418ea9d17630840992b783b5310bf22b32f9e4e180121be57d5eff818bf4b')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
