# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: douglarek

pkgname=yuki-iptv-bin
pkgver=0.0.13
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
sha512sums=('117656da11519ad1cbe44b83eeca3c223215d9448f260253970bf72083ad509fd28f24f910ee9c80105c788160c152bc64c22aeef0a11c024ab9ec3b94b6ba0d')

package() {
        bsdtar -xf data.tar.xz -C "${pkgdir}"
}
