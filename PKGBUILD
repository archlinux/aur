# Maintainer: Elven Inquisition <no.one.expects@faerie.me>
# Contributor: Tranalogic
# Contributor: jskier
# Contributor: archjo
# Contributor: napcok
# Contributor: goetzc

pkgname=ubuntu-mate-themes
pkgver=26.10.0
pkgrel=1
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("https://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('0bac7c0503b8601cc889140677693d50c047a6666caaaf1ba35580e5dde2b3d9634d06ecc7f1e83390ebf80701a405074326923f2f69d36e9883ae608f99b29e')
b2sums=('2f41c550e5488522c357eddd87d67c5bbdcb1c28c427ba06d963f641ff7c5f2dabfda75c0398455a093ff3113ae6866f40e643d654994c6305d2f9d21a25faab')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
