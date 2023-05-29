# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2023.05.26
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('bdd9ed523f148ecdb4b181bc8f13ea2a47f58abcd570db23b7b51541f491df12')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
