# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: AntiCompositeNumber <aur@anticomposite.net>
pkgname=gtfsclean-bin
pkgver=snapshot_5
pkgrel=1
pkgdesc="A tool for checking, sanitizing and minimizing GTFS feeds."
arch=('x86_64')
url="https://github.com/public-transport/gtfsclean"
license=('GPL-2.0-only')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('gtfsclean')
conflicts=('gtfsclean')
source=("gtfsclean-${pkgver}::https://github.com/public-transport/gtfsclean/releases/download/${pkgver//_/-}/gtfsclean")
noextract=("gtfsclean")
b2sums=('9d6c9c1299c2d044a8390154a3b3cb116334d65d263b469902fdd500d7884b11d844df9797e3b36f6b18f62470e31841fc5b6ae66a6fe9d198617032fdf36e19')

package() {
    install -Dm755 "gtfsclean-${pkgver}" "$pkgdir/usr/bin/gtfsclean"
}
