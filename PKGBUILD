# Maintainer: Gianmarco Gargiulo <me@gianmarco.gg>
pkgname=harmony2
pkgver=2.0.4
pkgrel=5
pkgdesc="Dream Sounds: Harmony 2 sound theme for KDE Plasma"
arch=(any)
url="https://gianmarco.gg/other/harmony2/"
license=('CC-BY-SA-4.0')
optdepends=('plasma-desktop: the desktop this theme was intended for')
source=("https://git.gianmarco.gg/gianmarco/harmony2/releases/download/$pkgver/ds-harmony2-$pkgver.tar.gz")
sha256sums=(008cf4641f315ff459084906da5a986d2a30c5d65226e2d169310173885ce771)

package() {
       install -d "$pkgdir/usr/share/sounds/harmony2"
       cp -r "$srcdir"/{stereo,index.theme} "$pkgdir/usr/share/sounds/harmony2"
}
