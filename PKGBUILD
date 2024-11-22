# Maintainer: Gianmarco Gargiulo <me@gianmarco.gg>
pkgname=harmony2
pkgver=2.0.3
pkgrel=4
pkgdesc="Dream Sounds: Harmony 2 sound theme for KDE Plasma"
arch=(any)
url="https://gianmarco.gg/other/harmony2/"
license=('CC-BY-SA-4.0')
optdepends=('plasma-desktop: the desktop this theme was intended for')
source=("https://git.gianmarco.gg/gianmarco/harmony2/releases/download/$pkgver/ds-harmony2-$pkgver.tar.gz")
sha256sums=(fea2579dab7aec83aa2dac483e1388549c56e67e071f8935f37ede906ca77b6d)

package() {
       install -d "$pkgdir/usr/share/sounds/harmony2"
       cp -r "$srcdir"/{stereo,index.theme} "$pkgdir/usr/share/sounds/harmony2"
}
