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
sha256sums=("1dfa5c62252b70c2f14319479a59163d1e3270b0d459a30ed42efbeab44d9d53")

package() {
    path="$srcdir/$pkgname-$pkgver.$pkgrel"
    cd $path
    install -Dm755 "$path/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
