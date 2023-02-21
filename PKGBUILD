# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

pkgname=gnome-shell-extension-screen-rotate
_reponame=gnome-shell-extension-screen-autorotate
pkgver=9
pkgrel=1
pkgdesc="A GNOME extension to enable screen rotation regardless of touch mode. Fork of Screen Autorotate by Kosmospredanie."
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9c0f7498aa5be4063f2b1bf8cdc5d37ae563b7c2ef7422e97ebed51fb8390431effe7831a02cce057f38979bd1a1c707aab98aa341c2a3f5912e927845b287ba')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_reponame-$pkgver/screen-rotate@shyzus.github.io" "$_"
}

