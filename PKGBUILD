# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2023.09.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('11674f9f76024ffe17ce899635f6cf094fe62895b88437776c4b85ffbd414f67')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
