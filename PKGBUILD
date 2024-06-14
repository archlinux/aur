# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://codeberg.org/Ame-chan-angel/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("yuki-iptv_${pkgver}_all.deb::$url/releases/download/$pkgver/yuki-iptv_${pkgver}_all.deb")
sha512sums=('9887db73946f49273e5bf138a1a496dabb28f9b36e94c94d8a94a5f66d8e5959dcacb266ab2021a8d288421dfa0e02f2b64de317a6c78d954aa2aa5f7985a701')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
