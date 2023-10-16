# Maintainer: crimist <aur at crim dot ist>
# Contributor: Ghassan Alduraibi <git@ghassan.dev>

pkgname=gnome-shell-extension-screen-rotate
_reponame=gnome-shell-extension-screen-autorotate
pkgver=14
pkgrel=1
pkgdesc="A GNOME extension to enable screen rotation regardless of touch mode. Fork of Screen Autorotate by Kosmospredanie."
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('3ffec227db198065d87478606608e42021349093217a2702e7c23eabc3e96f905bdf7003a11dab517ae399fdbfe4cce158af63022f596b51ea74a09d54122043')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_reponame-$pkgver/screen-rotate@shyzus.github.io" "$_"
}

