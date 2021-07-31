# Maintainer: Mahdy Mirzade <me@mahdym.ir>
pkgname=gip
pkgver=1.0
pkgrel=2
pkgdesc="Get Private/Public IP & IP's Geolocation."
arch=(any)
url="https://github.com/mahdymirzade/gip"
license=('GPL-3.0')
depends=('dog' 'grep' 'curl' 'jq')
makedepends=('git')
source=("$pkgname-$pkgver.$pkgrel.tar.gz::https://github.com/MahdyMirzade/$pkgname/archive/refs/tags/$pkgver.$pkgrel.tar.gz")
sha256sums=("207167246fa45854878e4b548da1acd7c84984f760383e701d8847811b725385")

package() {
    path="$srcdir/$pkgname-$pkgver.$pkgrel"
    cd $path
    install -Dm755 "$path/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
