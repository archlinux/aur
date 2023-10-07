# Maintainer: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("yuki-iptv_${pkgver}_all.deb::$url/releases/download/$pkgver/yuki-iptv_${pkgver}_all.deb")
sha512sums=('e39f6a740da1c8bba7aa1631c75c1f71ddc1564fc46c26ab6fd3629be5cb89578e535f85d22d586806c91240886f556c0c048c3a46d0b0d65c23db5da58baad8')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
