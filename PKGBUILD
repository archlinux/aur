# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2022.12.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('d7a415d181dfff22b6bad62d493181cc38dbde484d4c50de92c065b58d4a4071')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
