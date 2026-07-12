# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2026.06.27
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=('GPL-2.0-or-later')
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('7f2f3eb718818e09a8beb5b05b4d9eef5d766d8d1c5c128da834bbe371024507')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
