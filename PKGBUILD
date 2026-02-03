# Maintainer: Elven Inquisition <no.one.expects@faerie.me>
# Contributor: Tranalogic
# Contributor: jskier
# Contributor: archjo
# Contributor: napcok
# Contributor: goetzc

pkgname=ubuntu-mate-themes
pkgver=24.10.0
pkgrel=2
pkgdesc="GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
groups=('mate-extra')
depends=('gtk-engine-murrine')
optdepends=("ubuntu-mate-icon-themes: The official icon themes for Ubuntu MATE.")
source=("https://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('c4659b8dac44c1378ce652236683c1cf211feb896b50bb73b12924ffb52c8664')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
