# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

pkgname=gnome-shell-extension-screen-rotate
_reponame=gnome-shell-extension-screen-autorotate
pkgver=8
pkgrel=1
pkgdesc="A GNOME extension to enable screen rotation regardless of touch mode. Fork of Screen Autorotate by Kosmospredanie."
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8f5a85ac23a3610449899250403a4f47933ebc30f8313935c3b85eb44abe95ac145cecd54d922b3b7470b04a03c07ddb840e6472fcf62c217f61750840227f0b')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_reponame-$pkgver/screen-rotate@shyzus.github.io" "$_"
}

