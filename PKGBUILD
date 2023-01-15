# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=35
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('0c455d4457a888e39db44e4fe27ddc68')
sha1sums=('71f277410863c9dac4fcf4d2fea86d46993b9bec')
sha512sums=('46c97c51d2e832a03411c11d69f5e325a07fe4945f62694dfedd9f647beae88eb1ed0939839716bd6cb271fa983e3505f805bd5631cdc21084a2e94b9a2f0225')

package() {
    cd "$pkgname-$pkgver"

    make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}
