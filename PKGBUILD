# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2022.11.26
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('6b8724b40025e9c18c78871a9d4d96fae0c8499c8dd47ff9e0363fc8eab854f5')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
