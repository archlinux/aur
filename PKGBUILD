# Maintainer: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("yuki-iptv_${pkgver}_all.deb::$url/releases/download/$pkgver/yuki-iptv_${pkgver}_all.deb")
sha512sums=('5cd9686b78a3dabfd4149d50df7250b7f619457b09ae2389ae23bca01cb4c65ba41b1e7fd1af38b0c5d136375caa763bfcbe99a983ed0d940fbb12b638fa6a53')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
