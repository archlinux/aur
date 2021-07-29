# Maintainer: Mahdy Mirzade <me@mahdym.ir>
pkgname=gip
pkgver=1.0
pkgrel=2
pkgdesc="Get Private/Public IP & IP's Geolocation."
arch=(any)
url="https://github.com/mahdymirzade/gip"
license=('GPL-3.0')
depends=('bind' 'grep' 'curl')
makedepends=('git')
source=("https://github.com/MahdyMirzade/$pkgname/archive/refs/tags/$pkgver.$pkgrel.tar.gz")
sha256sums=("000dcf3f510bd692df125af0a4d3cba0ffe9c1aaa4649e490ccec7b1edff5710")

package() {
    path="$srcdir/$pkgname-$pkgver.$pkgrel"
    cd $path
    install -Dm755 "$path/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
