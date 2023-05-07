# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=36
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha1sums=('f789629bfb43e43c93e1eb8f9aa6534dd182e1ec')
sha512sums=('3107dbf79d1b0e21a3de9d009919acf134a9c5aaf2ef50804782ef4ea1872cac0a208df8fe9a5903054259d565f2791119f6ad3982fd092940e31bd8b8e65a3b')

package() {
    cd "$pkgname-$pkgver"

    make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}
