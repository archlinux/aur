# Maintainer: Mahdy Mirzade <me@mahdym.ir>
pkgname=gip
pkgver=1.0
pkgrel=1
pkgdesc="Get Private/Public IP & IP's Geolocation."
arch=(any)
url="https://github.com/mahdymirzade/gip"
license=('GPL-3.0')
depends=('bind' 'grep' 'curl')
makedepends=('git')
source=("https://github.com/MahdyMirzade/$pkgname/archive/refs/tags/$pkgver.$pkgrel.tar.gz")
sha256sums=("a5792f91eddf6fe4f2f612ff0a5ff2da1116cfbb17ded349b1b0cee5a8f400d1")

package() {
    path="$srcdir/$pkgname-$pkgver.$pkgrel"
    cd $path
    install -Dm755 "$path/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
