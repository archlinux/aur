# Maintainer: crimist <aur at crim dot ist>
# Contributor: Ghassan Alduraibi <git@ghassan.dev>

pkgname=gnome-shell-extension-screen-rotate
_reponame=gnome-shell-extension-screen-autorotate
pkgver=15
pkgrel=1
pkgdesc="A GNOME extension to enable screen rotation regardless of touch mode. Fork of Screen Autorotate by Kosmospredanie."
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9f731b33ffbbad50f984d020a3cfc3fd851dfd6e76595f2e3a9712ac7de7e308a962fc829ab853f727be7fbb2403922466d40c470749a2a6258e22dc3e630feb')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_reponame-$pkgver/screen-rotate@shyzus.github.io" "$_"
}

