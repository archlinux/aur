# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.14
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
sha512sums=('c3da972abac0023729d466aeeeeafa776d4be8143640ccba094e9ed96bf5f66377c79645826e1cd04cd8aee000a9a0baccbc702b73d32db57cbcd4fbf0c49112')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
