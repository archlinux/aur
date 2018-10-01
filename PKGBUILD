# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2018.09.30
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=http://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('5148db189c0d3c8355347665506d4446c94e203997f08be6d0e267fb4cea924c')

package() {
    bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}
