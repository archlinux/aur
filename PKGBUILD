# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=wicd-mono-icons
pkgver=2
pkgrel=3
arch=('any')
pkgdesc="Mono icons for Wicd Network Manager"
url="http://gnome-look.org/content/show.php/wicd+icons+mixup?content=113544"
license=('GPL')
depends=('wicd-gtk')
conflicts=('wicd-pale-icons' 'wicd-dark-icons')
source=(http://gnome-look.org/CONTENT/content-files/113544-wicd-icons-mixup-06012010.tar.bz2)
md5sums=('e1db447eeacef8758736951ddb4727bc')

package() {
    mkdir -p "${pkgdir}"/usr/share/pixmaps/wicd
    cp "${srcdir}"/* "${pkgdir}"/usr/share/pixmaps/wicd -R
}
