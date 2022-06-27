# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2022.06.26
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('f08c18092e67f4fcb3964e4182e736157661a56628290d031eea3423be273ab9')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
