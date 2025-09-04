# Maintainer: Gianmarco Gargiulo <me@gianmarco.gg>
pkgname=harmony2
pkgver=2.0.5
pkgrel=6
pkgdesc="Dream Sounds: Harmony 2 sound theme for KDE Plasma"
arch=(any)
url="https://gianmarco.gg/gallery/2024/03/harmony2/"
license=('CC-BY-SA-4.0')
optdepends=('plasma-desktop: the desktop this theme was intended for')
source=("https://git.gianmarco.gg/gianmarco/harmony2/releases/download/$pkgver/ds-harmony2-$pkgver.tar.gz")
sha256sums=(885bc9f347fc63997c2f82bb7f35ebc2b4d534821a8476ac031092b921696fc9)

package() {
       install -d "$pkgdir/usr/share/sounds/harmony2"
       cp -r "$srcdir"/{stereo,index.theme} "$pkgdir/usr/share/sounds/harmony2"
}
