# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2022.11.30
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('2f6283b42b14641311532bf0163120c02176c10d7c0c8d244db8ca22c188fa47')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
