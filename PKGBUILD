# Maintainer: crimist <aur at crim dot ist>
# Contributor: Ghassan Alduraibi <git@ghassan.dev>

pkgname=gnome-shell-extension-screen-rotate
_reponame=gnome-shell-extension-screen-autorotate
pkgver=20
pkgrel=1
pkgdesc="A GNOME extension to enable screen rotation regardless of touch mode. Fork of Screen Autorotate by Kosmospredanie."
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a3dcac6235abec69a6acf00f8d9ee1112153e13011238e98f537c790352f6dd3b89a3d5fd1cfc921ccd3a0f68c5d59579297372aa94f445843dae57429a118ef')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_reponame-$pkgver/screen-rotate@shyzus.github.io" "$_"
}

