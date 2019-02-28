# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2019.02.25
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=http://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('7cd4afff84e4990b87479e20cb1235f9deff6ff4d65df7db1c9d713f99fb41d3')

package() {
    bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}
