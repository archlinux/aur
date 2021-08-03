# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-autosub-zh
_pkgname=${pkgname%-zh}
pkgver=0.0.1
pkgrel=1
pkgdesc="Fully automatic subtitle (Chinese) downloading for the MPV media player"
arch=("any")
url="https://github.com/davidde/mpv-autosub"
license=("MIT")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname#mpv-}.lua")
sha256sums=('45b4a1b1a88899b92f5e396982443034105f10e393f1279841d4a1d511b2b53b')

package() {
  install -Dm644 "$source" \
    -t "$pkgdir"/usr/share/mpv/scripts
}
