# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=wicd-dark-icons
pkgver=1
pkgrel=2
arch=('any')
pkgdesc="Dark mono icons for Wicd Network Manager"
url="http://kde-look.org/content/show.php/Alternate+Wicd+Tray+Icons?content=125921"
license=('GPL')
depends=('wicd-gtk')
conflicts=('wicd-mono-icons' 'wicd-pale-icons')
source=(http://kde-look.org/CONTENT/content-files/125921-wicd.tar.gz)
md5sums=('1ccfb2cd61e4bc30a325211fce2ad8d9')

package() {
    mkdir -p "${pkgdir}"/usr/share/pixmaps/wicd
    cp "${srcdir}"/wicd-dark/* "${pkgdir}"/usr/share/pixmaps/wicd -R
}
