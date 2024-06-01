# Maintainer: Gianmarco Gargiulo <me@gianmarco.gg>
pkgname=harmony2
pkgver=2.0.2
pkgrel=3
pkgdesc="Dream Sounds: Harmony 2 sound theme for KDE Plasma"
arch=(any)
url="https://gianmarco.gg/other/harmony2/"
license=('CC-BY-SA-4.0')
optdepends=('plasma-desktop: the desktop this theme was intended for')
source=("https://git.gianmarco.gg/gianmarco/harmony2/releases/download/$pkgver/ds-harmony2-$pkgver.tar.gz")
sha256sums=(2088278d44b9dacf9aa61c12705fc2498d6c93217d8e0e8b6611b2729e2de20e)

package() {
       install -d "$pkgdir/usr/share/sounds/harmony2"
       cp -r "$srcdir"/{stereo,index.theme} "$pkgdir/usr/share/sounds/harmony2"
}
